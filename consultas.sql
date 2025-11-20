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

-- 2 Clientes con el Puntaje de Riesgo Más Bajo (Riesgo Excelente)
SELECT
    C.nombre,
    C.apellido,
    ER.puntajeRiesgo,
    ER.observaciones
FROM
    Cliente C
JOIN
    EvaluacionCliente EC ON C.idCliente = EC.idCliente
JOIN
    EvaluacionRiesgo ER ON EC.idEvaluacion = ER.idEvaluacion
WHERE
    ER.puntajeRiesgo = (SELECT MIN(puntajeRiesgo) FROM EvaluacionRiesgo); -- <- esta linea se va. convinar 2 valores (el mad bajo con ingreso bruto) mostrar los dos 
    
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
    'Monto Total Otorgado' DESC; -- corregir el orden que se muestra no es el correcto
    
-- 4 Solicitudes Rechazadas y la Observación de Riesgo Correspondiente
SELECT
    SC.idSolicitud, -- Organizar del mas reciente al mas antiguo
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
    ES.estado = 'Rechazada'; -- columna mas de fecha con el ordenado nuefo a viejo
    
-- 5 Empleados de Atención al Cliente que Registraron más Solicitudes
SELECT
    E.nombre, -- agregar mas solicitudes 
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
    'Total Solicitudes Registradas' DESC;
    
-- 6Cantidad de Cuotas Vencidas por Crédito y Cliente
SELECT
    Cte.nombre,
    Cte.apellido,
    Cr.idCredito,
    Cr.montoOtorgado,
    COUNT(Cu.idCuota) AS 'Cuotas Vencidas' -- revisar las cuotas vencidas
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

