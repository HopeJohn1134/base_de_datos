-- =============================================================================
-- VISTA 1: Vista_SolicitudesPendientes
-- Muestra las solicitudes que requieren atención inmediata (Estado 'Pendiente' o 'En Revisión')
-- =============================================================================
CREATE OR REPLACE VIEW Vista_SolicitudesPendientes AS
SELECT 
    S.idSolicitud,
    S.fechaSolicitud,
    C.dni AS DNI_Cliente,
    CONCAT(C.apellido, ', ', C.nombre) AS Cliente,
    PF.nombre AS Producto,
    S.montoSolicitado,
    ES.estado AS EstadoActual,
    E.apellido AS EmpleadoResponsable
FROM SolicitudCredito S
JOIN Cliente C ON S.idCliente = C.idCliente
JOIN ProductoFinanciero PF ON S.idProducto = PF.idProducto
JOIN EstadoSolicitud ES ON S.idEstadoSolicitud = ES.idEstado
JOIN Empleado E ON S.idEmpleado = E.idEmpleado
WHERE ES.estado IN ('Pendiente de Evaluación', 'En Revisión');

-- CONTROL DE ACCESO (GRANT)
-- El Analista necesita ver esto para trabajar.
GRANT SELECT ON SistemaCreditos.Vista_SolicitudesPendientes TO 'AnalistaRiesgos'@'%';
-- Atención al cliente necesita ver esto para responder consultas.
GRANT SELECT ON SistemaCreditos.Vista_SolicitudesPendientes TO 'AtencionCliente'@'%';

-- =============================================================================
-- VISTA 2: Vista_DeudaExigible
-- Muestra cuotas vencidas o por vencer hoy que no están pagadas
-- =============================================================================
CREATE OR REPLACE VIEW Vista_DeudaExigible AS
SELECT 
    Cu.idCuota,
    Cr.idCredito,
    C.dni AS DNI_Cliente,
    CONCAT(C.nombre, ' ', C.apellido) AS Cliente,
    Cu.numeroCuota,
    Cu.fechaVencimiento,
    Cu.montoTotal,
    DATEDIFF(NOW(), Cu.fechaVencimiento) AS DiasDeAtraso,
    EC.estado AS EstadoCuota
FROM Cuota Cu
JOIN Credito Cr ON Cu.idCredito = Cr.idCredito
JOIN SolicitudCredito S ON Cr.idSolicitud = S.idSolicitud
JOIN Cliente C ON S.idCliente = C.idCliente
JOIN EstadoCuota EC ON Cu.idEstadoCuota = EC.idEstado
WHERE Cu.idEstadoCuota != 2 -- 2 = Pagada (Asumiendo ID según tus inserts)
  AND Cu.fechaVencimiento <= NOW();

-- CONTROL DE ACCESO (GRANT)
-- El Cajero es quien recibe el dinero, debe ver la deuda rápidamente.
GRANT SELECT ON SistemaCreditos.Vista_DeudaExigible TO 'Cajero'@'%';
-- El Gerente supervisa la cartera en rojo.
GRANT SELECT ON SistemaCreditos.Vista_DeudaExigible TO 'Gerente'@'%';


-- =============================================================================
-- VISTA 3: Vista_RendimientoSucursales
-- Reporte agrupado de créditos otorgados y montos por sucursal
-- =============================================================================
CREATE OR REPLACE VIEW Vista_RendimientoSucursales AS
SELECT 
    Suc.nombre AS Sucursal,
    Prov.nombre AS Provincia,
    COUNT(Cr.idCredito) AS CantidadCreditosOtorgados,
    COALESCE(SUM(Cr.montoOtorgado), 0) AS MontoTotalColocado,
    AVG(Cr.tasaInteres) AS TasaPromedioAplicada
FROM Sucursal Suc
JOIN Provincia Prov ON Suc.idProvincia = Prov.idProvincia
LEFT JOIN Empleado E ON Suc.idSucursal = E.idSucursal
LEFT JOIN SolicitudCredito S ON E.idEmpleado = S.idEmpleado
LEFT JOIN Credito Cr ON S.idSolicitud = Cr.idSolicitud
GROUP BY Suc.idSucursal, Suc.nombre, Prov.nombre
ORDER BY MontoTotalColocado DESC;

-- CONTROL DE ACCESO (GRANT)
-- Solo el Gerente tiene acceso a esta vista estratégica global.
GRANT SELECT ON SistemaCreditos.Vista_RendimientoSucursales TO 'Gerente'@'%';