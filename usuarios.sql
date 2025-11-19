-- ==============================================================================
-- 1. USUARIO: AdminBD
-- Rol: Administrador de Base de Datos
-- ==============================================================================
CREATE USER 'AdminBD'@'localhost' IDENTIFIED BY 'Admin_2025!';
GRANT ALL PRIVILEGES ON SistemaCreditos.* TO 'AdminBD'@'localhost' WITH GRANT OPTION;


-- ==============================================================================
-- 2. USUARIO: Atención al Cliente
-- Rol: Oficial de cuentas / Recepción
-- Tarea: Cargar clientes y solicitudes. La auditoría la llena el Trigger.
-- ==============================================================================
CREATE USER 'AtencionCliente'@'%' IDENTIFIED BY 'Hola123!';

-- Lectura
GRANT SELECT ON SistemaCreditos.Cliente TO 'AtencionCliente'@'%';
GRANT SELECT ON SistemaCreditos.Garante TO 'AtencionCliente'@'%';
GRANT SELECT ON SistemaCreditos.ProductoFinanciero TO 'AtencionCliente'@'%';
GRANT SELECT ON SistemaCreditos.Sucursal TO 'AtencionCliente'@'%';
GRANT SELECT ON SistemaCreditos.Provincias TO 'AtencionCliente'@'%';
GRANT SELECT ON SistemaCreditos.TipoProductoFinanciero TO 'AtencionCliente'@'%';

-- Escritura
-- Nota: Al dar INSERT/UPDATE a nivel tabla, el usuario inserta los datos del cliente
-- y el trigger se encarga silenciosamente de poner usuarioAlta/Modif.
GRANT INSERT, UPDATE ON SistemaCreditos.Cliente TO 'AtencionCliente'@'%';
GRANT INSERT, UPDATE ON SistemaCreditos.Garante TO 'AtencionCliente'@'%';
GRANT INSERT ON SistemaCreditos.SolicitudCredito TO 'AtencionCliente'@'%';
GRANT INSERT ON SistemaCreditos.GaranteSolicitud TO 'AtencionCliente'@'%';


-- ==============================================================================
-- 3. USUARIO: Analista de Riesgos
-- Rol: Evaluador de crédito
-- Tarea: Solo debe poder cambiar el ESTADO de la solicitud. Nada más.
-- ==============================================================================
CREATE USER 'AnalistaRiesgos'@'%' IDENTIFIED BY 'Riesgo_2025!';

-- Lectura
GRANT SELECT ON SistemaCreditos.Cliente TO 'AnalistaRiesgos'@'%';
GRANT SELECT ON SistemaCreditos.SolicitudCredito TO 'AnalistaRiesgos'@'%';
GRANT SELECT ON SistemaCreditos.HistoricoTasa TO 'AnalistaRiesgos'@'%';
GRANT SELECT ON SistemaCreditos.EvaluacionRiesgo TO 'AnalistaRiesgos'@'%';

-- Escritura
GRANT INSERT, UPDATE ON SistemaCreditos.EvaluacionRiesgo TO 'AnalistaRiesgos'@'%';
GRANT INSERT, UPDATE ON SistemaCreditos.EvaluacionCliente TO 'AnalistaRiesgos'@'%';
GRANT INSERT, UPDATE ON SistemaCreditos.EvaluacionGarante TO 'AnalistaRiesgos'@'%';

-- AQUÍ EL CAMBIO: Solo permiso para cambiar el estado.
-- El trigger actualizará fechaModif y usuarioModif automáticamente.
GRANT UPDATE (idEstadoSolicitud) ON SistemaCreditos.SolicitudCredito TO 'AnalistaRiesgos'@'%';


-- ==============================================================================
-- 4. USUARIO: Cajero
-- Rol: Tesorería
-- Tarea: Solo debe poder cambiar el ESTADO de la cuota a 'Pagada'.
-- ==============================================================================
CREATE USER 'Cajero'@'%' IDENTIFIED BY 'Caja_2025!';

-- Lectura
GRANT SELECT ON SistemaCreditos.Cliente TO 'Cajero'@'%';
GRANT SELECT ON SistemaCreditos.Credito TO 'Cajero'@'%';
GRANT SELECT ON SistemaCreditos.Cuota TO 'Cajero'@'%';
GRANT SELECT ON SistemaCreditos.MetodoPago TO 'Cajero'@'%';
GRANT SELECT ON SistemaCreditos.EstadoCuota TO 'Cajero'@'%';

-- Escritura
GRANT INSERT ON SistemaCreditos.Pago TO 'Cajero'@'%';

-- AQUÍ EL CAMBIO: Solo permiso para cambiar el estado de la cuota.
GRANT UPDATE (idEstadoCuota) ON SistemaCreditos.Cuota TO 'Cajero'@'%';


-- ==============================================================================
-- 5. USUARIO: Gerente
-- Rol: Supervisión
-- ==============================================================================
CREATE USER 'Gerente'@'%' IDENTIFIED BY 'Gerencia_2025!';

-- Lectura Total
GRANT SELECT ON SistemaCreditos.* TO 'Gerente'@'%';

-- Gestión
GRANT INSERT, UPDATE, DELETE ON SistemaCreditos.CampaniaPromocional TO 'Gerente'@'%';
GRANT INSERT, UPDATE, DELETE ON SistemaCreditos.CampaniaProducto TO 'Gerente'@'%';
GRANT INSERT, UPDATE ON SistemaCreditos.Empleado TO 'Gerente'@'%';
GRANT INSERT, UPDATE ON SistemaCreditos.ProductoFinanciero TO 'Gerente'@'%';


-- ==============================================================================
-- Aplicar privilegios
-- ==============================================================================
FLUSH PRIVILEGES;