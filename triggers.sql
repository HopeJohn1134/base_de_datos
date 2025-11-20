use SistemaCreditos;

DELIMITER $$
-- Provincia
DROP TRIGGER IF EXISTS trg_Provincia_INS$$
CREATE TRIGGER trg_Provincia_INS BEFORE INSERT ON Provincia FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Provincia_UPD$$
CREATE TRIGGER trg_Provincia_UPD BEFORE UPDATE ON Provincia FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- EstadoSolicitud
DROP TRIGGER IF EXISTS trg_EstadoSolicitud_INS$$
CREATE TRIGGER trg_EstadoSolicitud_INS BEFORE INSERT ON EstadoSolicitud FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_EstadoSolicitud_UPD$$
CREATE TRIGGER trg_EstadoSolicitud_UPD BEFORE UPDATE ON EstadoSolicitud FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- EstadoCuota
DROP TRIGGER IF EXISTS trg_EstadoCuota_INS$$
CREATE TRIGGER trg_EstadoCuota_INS BEFORE INSERT ON EstadoCuota FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_EstadoCuota_UPD$$
CREATE TRIGGER trg_EstadoCuota_UPD BEFORE UPDATE ON EstadoCuota FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- MetodoPago
DROP TRIGGER IF EXISTS trg_MetodoPago_INS$$
CREATE TRIGGER trg_MetodoPago_INS BEFORE INSERT ON MetodoPago FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_MetodoPago_UPD$$
CREATE TRIGGER trg_MetodoPago_UPD BEFORE UPDATE ON MetodoPago FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- TipoProductoFinanciero
DROP TRIGGER IF EXISTS trg_TipoProducto_INS$$
CREATE TRIGGER trg_TipoProducto_INS BEFORE INSERT ON TipoProductoFinanciero FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_TipoProducto_UPD$$
CREATE TRIGGER trg_TipoProducto_UPD BEFORE UPDATE ON TipoProductoFinanciero FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- TipoEmpleado
DROP TRIGGER IF EXISTS trg_TipoEmpleado_INS$$
CREATE TRIGGER trg_TipoEmpleado_INS BEFORE INSERT ON TipoEmpleado FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_TipoEmpleado_UPD$$
CREATE TRIGGER trg_TipoEmpleado_UPD BEFORE UPDATE ON TipoEmpleado FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- CampaniaPromocional
DROP TRIGGER IF EXISTS trg_Campania_INS$$
CREATE TRIGGER trg_Campania_INS BEFORE INSERT ON CampaniaPromocional FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Campania_UPD$$
CREATE TRIGGER trg_Campania_UPD BEFORE UPDATE ON CampaniaPromocional FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$


-- EvaluacionRiesgo
DROP TRIGGER IF EXISTS trg_EvaluacionRiesgo_INS$$
CREATE TRIGGER trg_EvaluacionRiesgo_INS BEFORE INSERT ON EvaluacionRiesgo FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_EvaluacionRiesgo_UPD$$
CREATE TRIGGER trg_EvaluacionRiesgo_UPD BEFORE UPDATE ON EvaluacionRiesgo FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Garante
DROP TRIGGER IF EXISTS trg_Garante_INS$$
CREATE TRIGGER trg_Garante_INS BEFORE INSERT ON Garante FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Garante_UPD$$
CREATE TRIGGER trg_Garante_UPD BEFORE UPDATE ON Garante FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Cliente
DROP TRIGGER IF EXISTS trg_Cliente_INS$$
CREATE TRIGGER trg_Cliente_INS BEFORE INSERT ON Cliente FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Cliente_UPD$$
CREATE TRIGGER trg_Cliente_UPD BEFORE UPDATE ON Cliente FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Empleado
DROP TRIGGER IF EXISTS trg_Empleado_INS$$
CREATE TRIGGER trg_Empleado_INS BEFORE INSERT ON Empleado FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Empleado_UPD$$
CREATE TRIGGER trg_Empleado_UPD BEFORE UPDATE ON Empleado FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Sucursal
DROP TRIGGER IF EXISTS trg_Sucursal_INS$$
CREATE TRIGGER trg_Sucursal_INS BEFORE INSERT ON Sucursal FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Sucursal_UPD$$
CREATE TRIGGER trg_Sucursal_UPD BEFORE UPDATE ON Sucursal FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- ProductoFinanciero
DROP TRIGGER IF EXISTS trg_Producto_INS$$
CREATE TRIGGER trg_Producto_INS BEFORE INSERT ON ProductoFinanciero FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Producto_UPD$$
CREATE TRIGGER trg_Producto_UPD BEFORE UPDATE ON ProductoFinanciero FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- HistoricoTasa
DROP TRIGGER IF EXISTS trg_HistoricoTasa_INS$$
CREATE TRIGGER trg_HistoricoTasa_INS BEFORE INSERT ON HistoricoTasa FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_HistoricoTasa_UPD$$
CREATE TRIGGER trg_HistoricoTasa_UPD BEFORE UPDATE ON HistoricoTasa FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- =============================================
-- 4. TRANSACCIONALES (SOLICITUDES Y CREDITOS)
-- =============================================

-- SolicitudCredito
DROP TRIGGER IF EXISTS trg_SolicitudCredito_INS$$
CREATE TRIGGER trg_SolicitudCredito_INS BEFORE INSERT ON SolicitudCredito FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_SolicitudCredito_UPD$$
CREATE TRIGGER trg_SolicitudCredito_UPD BEFORE UPDATE ON SolicitudCredito FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Credito
DROP TRIGGER IF EXISTS trg_Credito_INS$$
CREATE TRIGGER trg_Credito_INS BEFORE INSERT ON Credito FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Credito_UPD$$
CREATE TRIGGER trg_Credito_UPD BEFORE UPDATE ON Credito FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Cuota
DROP TRIGGER IF EXISTS trg_Cuota_INS$$
CREATE TRIGGER trg_Cuota_INS BEFORE INSERT ON Cuota FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Cuota_UPD$$
CREATE TRIGGER trg_Cuota_UPD BEFORE UPDATE ON Cuota FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Pago
DROP TRIGGER IF EXISTS trg_Pago_INS$$
CREATE TRIGGER trg_Pago_INS BEFORE INSERT ON Pago FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Pago_UPD$$
CREATE TRIGGER trg_Pago_UPD BEFORE UPDATE ON Pago FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- Penalizacion
DROP TRIGGER IF EXISTS trg_Penalizacion_INS$$
CREATE TRIGGER trg_Penalizacion_INS BEFORE INSERT ON Penalizacion FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_Penalizacion_UPD$$
CREATE TRIGGER trg_Penalizacion_UPD BEFORE UPDATE ON Penalizacion FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- =============================================
-- 5. TABLAS INTERMEDIAS (Muchos a Muchos)
-- =============================================

-- CampaniaProducto
DROP TRIGGER IF EXISTS trg_CampaniaProducto_INS$$
CREATE TRIGGER trg_CampaniaProducto_INS BEFORE INSERT ON CampaniaProducto FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_CampaniaProducto_UPD$$
CREATE TRIGGER trg_CampaniaProducto_UPD BEFORE UPDATE ON CampaniaProducto FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- CampaniaCliente
DROP TRIGGER IF EXISTS trg_CampaniaCliente_INS$$
CREATE TRIGGER trg_CampaniaCliente_INS BEFORE INSERT ON CampaniaCliente FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_CampaniaCliente_UPD$$
CREATE TRIGGER trg_CampaniaCliente_UPD BEFORE UPDATE ON CampaniaCliente FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- EvaluacionGarante
DROP TRIGGER IF EXISTS trg_EvaluacionGarante_INS$$
CREATE TRIGGER trg_EvaluacionGarante_INS BEFORE INSERT ON EvaluacionGarante FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_EvaluacionGarante_UPD$$
CREATE TRIGGER trg_EvaluacionGarante_UPD BEFORE UPDATE ON EvaluacionGarante FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- EvaluacionCliente
DROP TRIGGER IF EXISTS trg_EvaluacionCliente_INS$$
CREATE TRIGGER trg_EvaluacionCliente_INS BEFORE INSERT ON EvaluacionCliente FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_EvaluacionCliente_UPD$$
CREATE TRIGGER trg_EvaluacionCliente_UPD BEFORE UPDATE ON EvaluacionCliente FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$

-- GaranteSolicitud
DROP TRIGGER IF EXISTS trg_GaranteSolicitud_INS$$
CREATE TRIGGER trg_GaranteSolicitud_INS BEFORE INSERT ON GaranteSolicitud FOR EACH ROW BEGIN
    SET NEW.usuarioAlta = IFNULL(NEW.usuarioAlta, SUBSTRING_INDEX(USER(), '@', 1));
    SET NEW.usuarioModif = NEW.usuarioAlta;
    SET NEW.fechaAlta = NOW();
END$$
DROP TRIGGER IF EXISTS trg_GaranteSolicitud_UPD$$
CREATE TRIGGER trg_GaranteSolicitud_UPD BEFORE UPDATE ON GaranteSolicitud FOR EACH ROW BEGIN
    SET NEW.usuarioModif = SUBSTRING_INDEX(USER(), '@', 1);
END$$



DELIMITER ;