use SistemaCreditos;
-- 1 Producto Financiero con la Tasa de Interés Actual Más Alta
SELECT
    pf.nombre AS 'Producto',
    ht.tasa AS 'Tasa Máxima (%)',
    tpf.tipo AS 'Tipo de Producto'
FROM
    HistoricoTasa ht
JOIN
    ProductoFinanciero pf ON ht.idProducto = pf.idProducto
JOIN
    TipoProductoFinanciero tpf ON pf.idTipoProducto = tpf.idTipo
WHERE
    ht.fechaFin IS NULL
ORDER BY
    ht.tasa DESC;

-- 2 Clientes con el Puntaje de Riesgo Más Bajo
SELECT
    C.nombre,
    C.apellido,
    ER.puntajeRiesgo,
    ER.ingresosDeclaradosMensual,
    ER.observaciones
FROM
    Cliente C
JOIN
    EvaluacionCliente EC ON C.idCliente = EC.idCliente
JOIN
    EvaluacionRiesgo ER ON EC.idEvaluacion = ER.idEvaluacion
ORDER BY
    ER.puntajeRiesgo ASC;
    
-- Consultas de Análisis Transaccional y Auditoría 
-- 3 Monto Total de Créditos Otorgados por Tipo de Producto
    SELECT
    tpf.tipo AS 'Tipo de Producto',
    COUNT(c.idCredito) AS 'Cantidad de Créditos',
    SUM(c.montoOtorgado) AS 'Monto Total Otorgado'
FROM
    Credito c
JOIN
    ProductoFinanciero pf ON c.idProducto = pf.idProducto
JOIN
    TipoProductoFinanciero tpf ON pf.idTipoProducto = tpf.idTipo
GROUP BY
    tpf.tipo
ORDER BY
    `Monto Total Otorgado` DESC; 

-- 4 Solicitudes Rechazadas y la Observación de Riesgo Correspondiente
 SELECT
    SC.idSolicitud, 
    C.nombre,
    C.apellido,
    PF.nombre AS 'Producto Solicitado',
    ER.puntajeRiesgo,
    ER.observaciones AS 'Motivo Rechazo'
FROM
    SolicitudCredito SC
JOIN
    Cliente C ON SC.idCliente = C.idCliente
JOIN
    ProductoFinanciero PF ON SC.idProducto = PF.idProducto
JOIN
    EstadoSolicitud ES ON SC.idEstadoSolicitud = ES.idEstado
JOIN
    EvaluacionRiesgo ER ON SC.idEvaluacionRelevante = ER.idEvaluacion
WHERE
    ES.estado = 'Rechazada';
SELECT
    SC.idSolicitud,
    C.nombre,
    C.apellido,
    PF.nombre AS 'Producto Solicitado',
    ER.puntajeRiesgo,
    ER.observaciones AS 'Motivo Rechazo'
FROM
    SolicitudCredito SC
JOIN
    Cliente C ON SC.idCliente = C.idCliente
JOIN
    ProductoFinanciero PF ON SC.idProducto = PF.idProducto
JOIN
    EstadoSolicitud ES ON SC.idEstadoSolicitud = ES.idEstado
JOIN
    EvaluacionRiesgo ER ON SC.idEvaluacionRelevante = ER.idEvaluacion
WHERE
    ES.estado = 'Rechazada'; 
 SELECT
    SC.idSolicitud,
    SC.fechaSolicitud, 
    C.nombre,
    C.apellido,
    PF.nombre AS 'Producto Solicitado',
    ER.puntajeRiesgo,
    ER.observaciones AS 'Motivo Rechazo'
FROM
    SolicitudCredito SC
JOIN
    Cliente C ON SC.idCliente = C.idCliente
JOIN
    ProductoFinanciero PF ON SC.idProducto = PF.idProducto
JOIN
    EstadoSolicitud ES ON SC.idEstadoSolicitud = ES.idEstado
JOIN
    EvaluacionRiesgo ER ON SC.idEvaluacionRelevante = ER.idEvaluacion
WHERE
    ES.estado = 'Rechazada'
ORDER BY
    SC.fechaSolicitud DESC; 

-- 5 Empleados de Atención al Cliente que Registraron más Solicitudes
SELECT
    E.nombre,
    E.apellido,
    TE.tipo AS 'Rol',
    COUNT(SC.idSolicitud) AS 'Total Solicitudes Registradas'
FROM
    Empleado E
JOIN
    TipoEmpleado TE ON E.idTipoEmpleado = TE.idTipo
LEFT JOIN
    SolicitudCredito SC ON E.idEmpleado = SC.idEmpleado
WHERE
    TE.tipo = 'Atención al Cliente'
GROUP BY
    E.idEmpleado, E.nombre, E.apellido, TE.tipo
ORDER BY
    `Total Solicitudes Registradas` DESC; 

-- 6Cantidad de Cuotas Vencidas por Crédito y Cliente
SELECT -- solo 3 cuotas vencidas para hacer de ejemplo
    Cte.nombre,
    Cte.apellido,
    Cr.idCredito,
    Cr.montoOtorgado,
    COUNT(Cu.idCuota) AS 'Cuotas Vencidas' 
FROM
    Cuota Cu
JOIN
    EstadoCuota EC ON Cu.idEstadoCuota = EC.idEstado
JOIN
    Credito Cr ON Cu.idCredito = Cr.idCredito
JOIN
    SolicitudCredito SC ON Cr.idSolicitud = SC.idSolicitud
JOIN
    Cliente Cte ON SC.idCliente = Cte.idCliente
WHERE
    EC.estado = 'Vencida'
GROUP BY
    Cte.nombre, Cte.apellido, Cr.idCredito, Cr.montoOtorgado
HAVING
    COUNT(Cu.idCuota) > 0
ORDER BY
    'Cuotas Vencidas' DESC;
    
-- Clasifica a los clientes según el monto total de créditos que han sacado
SELECT 
    C.nombre, 
    C.apellido, 
    SUM(Cr.montoOtorgado) as TotalHistorico,
    DENSE_RANK() OVER (ORDER BY SUM(Cr.montoOtorgado) DESC) as RankingCliente
FROM Cliente C
JOIN SolicitudCredito SC ON C.idCliente = SC.idCliente
JOIN Credito Cr ON SC.idSolicitud = Cr.idSolicitud
GROUP BY C.idCliente, C.nombre, C.apellido;

-- Muestra la cuota de mayor valor emitida en cada provincia
SELECT * FROM (
    SELECT 
        P.nombre as Provincia,
        S.nombre as Sucursal,
        Cr.idCredito,
        Cu.montoTotal,
        ROW_NUMBER() OVER (PARTITION BY P.nombre ORDER BY Cu.montoTotal DESC) as TopCuota
    FROM Provincia P
    JOIN Sucursal S ON P.idProvincia = S.idProvincia
    JOIN Empleado E ON S.idSucursal = E.idSucursal
    JOIN SolicitudCredito SC ON E.idEmpleado = SC.idEmpleado
    JOIN Credito Cr ON SC.idSolicitud = Cr.idSolicitud
    JOIN Cuota Cu ON Cr.idCredito = Cu.idCredito
) as RankingProvincial
WHERE TopCuota = 1;

-- Utiliza la función almacenada para etiquetar a los clientes
SELECT 
    C.idCliente,
    C.nombre,
    C.apellido,
    fn_ObtenerEstadoMorosidad(C.idCliente) AS EstadoActual
FROM Cliente C;

-- Clasifica los créditos en Corto, Mediano y Largo Plazo
SELECT 
    PF.nombre as Producto,
    Cr.plazoMeses,
    CASE 
        WHEN Cr.plazoMeses <= 12 THEN 'Corto Plazo'
        WHEN Cr.plazoMeses BETWEEN 13 AND 60 THEN 'Mediano Plazo'
        ELSE 'Largo Plazo'
    END as CategoriaPlazo,
    COUNT(*) as CantidadCreditos
FROM Credito Cr
JOIN ProductoFinanciero PF ON Cr.idProducto = PF.idProducto
GROUP BY PF.nombre, Cr.plazoMeses;


-- Calcula cuántos clientes adhirieron a productos de cada campaña
WITH ResumenCampania AS (
    SELECT 
        CP.nombre as Campania,
        COUNT(CC.idCliente) as ClientesAlcanzados
    FROM CampaniaPromocional CP
    JOIN CampaniaCliente CC ON CP.idCampania = CC.idCampania
    GROUP BY CP.nombre
)
SELECT * FROM ResumenCampania 
WHERE ClientesAlcanzados > 0
ORDER BY ClientesAlcanzados DESC;

-- Suma cuánto dinero debería entrar el próximo mes (cuotas no pagadas que vencen)
SELECT 
    MONTH(fechaVencimiento) as Mes,
    SUM(montoTotal) as FlujoEsperado
FROM Cuota
WHERE idEstadoCuota = 1 -- Pendiente
  AND MONTH(fechaVencimiento) = MONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH))
  AND YEAR(fechaVencimiento) = YEAR(DATE_ADD(NOW(), INTERVAL 1 MONTH))
GROUP BY MONTH(fechaVencimiento);

-- Lista unificada de correos electrónicos de Clientes y Garantes para newsletter
SELECT nombre, apellido, email, 'Cliente' as TipoPersona 
FROM Cliente
WHERE email IS NOT NULL
UNION
SELECT nombre, apellido, email, 'Garante' as TipoPersona 
FROM Garante
WHERE email IS NOT NULL;

-- Busca clientes cuyo email no sea gmail o hotmail (posibles corporativos)
SELECT nombre, apellido, email 
FROM Cliente
WHERE email NOT LIKE '%gmail%' 
  AND email NOT LIKE '%hotmail%'
  AND email NOT LIKE '%yahoo%';
  
  -- Clientes que tienen créditos activos pero aún no han hecho ningún pago
SELECT C.nombre, C.apellido
FROM Cliente C
JOIN SolicitudCredito SC ON C.idCliente = SC.idCliente
JOIN Credito Cr ON SC.idSolicitud = Cr.idSolicitud
WHERE NOT EXISTS (
    SELECT 1 FROM Cuota Cu
    JOIN Pago P ON Cu.idCuota = P.idCuota
    WHERE Cu.idCredito = Cr.idCredito
);

-- Garantes que están en más de una solicitud aprobada
SELECT 
    G.nombre, 
    G.apellido, 
    COUNT(GS.idSolicitud) as CantidadGarantias
FROM Garante G
JOIN GaranteSolicitud GS ON G.idGarante = GS.idGarante
GROUP BY G.idGarante, G.nombre, G.apellido
HAVING COUNT(GS.idSolicitud) > 1;

  
  -- Paso 1: Crear la Vista (Ejecutar una sola vez)
CREATE OR REPLACE VIEW Vista_DetalleDeuda AS
SELECT 
    Cl.nombre, 
    Cl.apellido, 
    Cr.idCredito, 
    SUM(Cu.montoTotal) as DeudaTotal,
    COUNT(CASE WHEN Cu.idEstadoCuota = 3 THEN 1 END) as CuotasVencidas
FROM Cliente Cl
JOIN SolicitudCredito SC ON Cl.idCliente = SC.idCliente
JOIN Credito Cr ON SC.idSolicitud = Cr.idSolicitud
JOIN Cuota Cu ON Cr.idCredito = Cu.idCredito
WHERE Cu.idEstadoCuota IN (1, 3) -- Pendiente o Vencida
GROUP BY Cl.nombre, Cl.apellido, Cr.idCredito;

-- Paso 2: Consultar la Vista
SELECT * FROM Vista_DetalleDeuda WHERE CuotasVencidas > 0;






