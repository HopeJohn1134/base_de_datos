USE SistemaCreditos;

DELIMITER $$

-- =============================================================================
-- 1. PROCEDIMIENTO: proc_RegistrarPagoCuota
-- Objetivo: Registrar el pago, validar montos y actualizar estado de la cuota.
-- Usuario: Cajero
-- =============================================================================
DROP PROCEDURE IF EXISTS proc_RegistrarPagoCuota$$

CREATE PROCEDURE proc_RegistrarPagoCuota(
    IN p_idCuota INT,
    IN p_montoPagado DECIMAL(15,2),
    IN p_idMetodoPago INT,
    IN p_usuario VARCHAR(50)
)
BEGIN
    DECLARE v_montoTotal DECIMAL(15,2);
    DECLARE v_idEstadoActual INT;
    DECLARE v_fechaVencimiento DATE;
    DECLARE v_diasDemora INT DEFAULT 0;

    -- Manejo de errores genérico para Rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción de pago.';
    END;

    -- 1. Obtener datos de la cuota
    SELECT montoTotal, idEstadoCuota, fechaVencimiento 
    INTO v_montoTotal, v_idEstadoActual, v_fechaVencimiento
    FROM Cuota WHERE idCuota = p_idCuota;

    -- Validaciones
    IF v_montoTotal IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cuota no existe.';
    END IF;

    IF v_idEstadoActual = 2 THEN -- Asumiendo 2 = Pagada
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cuota ya fue pagada.';
    END IF;

    IF p_montoPagado < v_montoTotal THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El monto es insuficiente para cubrir la cuota.';
    END IF;

    -- Calcular demora (Si paga antes, es 0)
    SET v_diasDemora = DATEDIFF(NOW(), v_fechaVencimiento);
    IF v_diasDemora < 0 THEN SET v_diasDemora = 0; END IF;

    START TRANSACTION;
        -- Insertar el Pago
        INSERT INTO Pago (idCuota, idMetodoPago, fechaPago, montoPagado, diasDemora, usuarioAlta)
        VALUES (p_idCuota, p_idMetodoPago, NOW(), p_montoPagado, v_diasDemora, p_usuario);

        -- Actualizar la Cuota a 'Pagada' (ID 2)
        UPDATE Cuota 
        SET idEstadoCuota = 2, usuarioModif = p_usuario
        WHERE idCuota = p_idCuota;
    COMMIT;
END$$

-- =============================================================================
-- 2. PROCEDIMIENTO: proc_AprobarCredito_GenerarCuotas
-- Objetivo: Aprobar solicitud, crear el crédito y generar cuotas automáticamente.
-- Usuario: Analista de Riesgos
-- =============================================================================
DROP PROCEDURE IF EXISTS proc_AprobarCredito_GenerarCuotas$$

CREATE PROCEDURE proc_AprobarCredito_GenerarCuotas(
    IN p_idSolicitud INT,
    IN p_montoOtorgado DECIMAL(15,2),
    IN p_tasaInteres DECIMAL(5,2),
    IN p_plazoMeses INT,
    IN p_usuario VARCHAR(50)
)
BEGIN
    DECLARE v_idCredito INT;
    DECLARE v_idProducto INT;
    DECLARE v_montoCuota DECIMAL(15,2);
    DECLARE v_fechaVencimiento DATE;
    DECLARE i INT DEFAULT 1;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al generar el crédito y cuotas.';
    END;

    -- Validar estado actual de solicitud (1 = Pendiente)
    IF (SELECT idEstadoSolicitud FROM SolicitudCredito WHERE idSolicitud = p_idSolicitud) != 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La solicitud no está pendiente.';
    END IF;

    -- Obtener producto
    SELECT idProducto INTO v_idProducto FROM SolicitudCredito WHERE idSolicitud = p_idSolicitud;

    START TRANSACTION;
        -- 1. Actualizar Solicitud a Aprobada (2)
        UPDATE SolicitudCredito 
        SET idEstadoSolicitud = 2, usuarioModif = p_usuario 
        WHERE idSolicitud = p_idSolicitud;

        -- 2. Crear el Crédito
        INSERT INTO Credito (idSolicitud, idProducto, montoOtorgado, tasaInteres, plazoMeses, fechaInicio, fechaFin, usuarioAlta)
        VALUES (p_idSolicitud, v_idProducto, p_montoOtorgado, p_tasaInteres, p_plazoMeses, CURDATE(), DATE_ADD(CURDATE(), INTERVAL p_plazoMeses MONTH), p_usuario);
        
        SET v_idCredito = LAST_INSERT_ID();

        -- 3. Calcular Monto Cuota (Sistema Francés simplificado o Interés simple para TPI)
        -- Fórmula simple: (Capital + (Capital * Tasa / 100)) / Plazo
        SET v_montoCuota = (p_montoOtorgado * (1 + (p_tasaInteres / 100))) / p_plazoMeses;

        -- 4. Loop para generar cuotas
        WHILE i <= p_plazoMeses DO
            SET v_fechaVencimiento = DATE_ADD(CURDATE(), INTERVAL i MONTH);
            
            INSERT INTO Cuota (idCredito, numeroCuota, fechaVencimiento, montoTotal, idEstadoCuota, usuarioAlta)
            VALUES (v_idCredito, i, v_fechaVencimiento, v_montoCuota, 1, p_usuario); -- 1 = Pendiente
            
            SET i = i + 1;
        END WHILE;

    COMMIT;
END$$

-- =============================================================================
-- 3. PROCEDIMIENTO: proc_AplicarPenalizacionAutomatica
-- Objetivo: Aplicar mora a cuotas vencidas si no están pagadas.
-- Usuario: Sistema / Admin
-- =============================================================================
DROP PROCEDURE IF EXISTS proc_AplicarPenalizacionAutomatica$$

CREATE PROCEDURE proc_AplicarPenalizacionAutomatica(
    IN p_idCuota INT,
    IN p_montoPenalizacion DECIMAL(15,2),
    IN p_motivo VARCHAR(255),
    IN p_usuario VARCHAR(50)
)
BEGIN
    DECLARE v_fechaVencimiento DATE;
    DECLARE v_idEstadoActual INT;
    DECLARE v_yaTienePenalizacion INT;

    SELECT fechaVencimiento, idEstadoCuota INTO v_fechaVencimiento, v_idEstadoActual
    FROM Cuota WHERE idCuota = p_idCuota;

    -- Validaciones
    IF v_fechaVencimiento IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cuota no existe.';
    END IF;

    IF v_idEstadoActual = 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cuota ya está pagada.';
    END IF;

    IF CURDATE() <= v_fechaVencimiento THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cuota aún no ha vencido.';
    END IF;

    -- Verificar duplicados
    SELECT COUNT(*) INTO v_yaTienePenalizacion FROM Penalizacion WHERE idCuota = p_idCuota;
    IF v_yaTienePenalizacion > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aviso: Ya existe penalización.';
    END IF;

    START TRANSACTION;
        INSERT INTO Penalizacion (idCuota, montoPenalizacion, motivo, fechaAplicacion, usuarioAlta)
        VALUES (p_idCuota, p_montoPenalizacion, p_motivo, NOW(), p_usuario);

        -- Cambiar a Vencida (3)
        UPDATE Cuota SET idEstadoCuota = 3, usuarioModif = p_usuario WHERE idCuota = p_idCuota;
    COMMIT;
END$$

-- =============================================================================
-- 4. PROCEDIMIENTO: proc_RefinanciarCredito
-- Objetivo: Cancelar crédito viejo y crear uno nuevo por el saldo deudor.
-- Usuario: Gerente / Atención
-- =============================================================================
DROP PROCEDURE IF EXISTS proc_RefinanciarCredito$$

CREATE PROCEDURE proc_RefinanciarCredito(
    IN p_idCreditoViejo INT,
    IN p_nuevoPlazo INT,
    IN p_nuevaTasa DECIMAL(5,2),
    IN p_usuario VARCHAR(50)
)
BEGIN
    DECLARE v_saldoDeudor DECIMAL(15,2);
    DECLARE v_idCliente INT;
    DECLARE v_idProducto INT;
    DECLARE v_idNuevaSolicitud INT;
    DECLARE v_idNuevoCredito INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al refinanciar el crédito.';
    END;

    -- 1. Calcular deuda (Suma de cuotas no pagadas)
    SELECT SUM(montoTotal) INTO v_saldoDeudor
    FROM Cuota 
    WHERE idCredito = p_idCreditoViejo AND idEstadoCuota != 2; -- Diferente de Pagada

    IF v_saldoDeudor IS NULL OR v_saldoDeudor <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito no tiene deuda pendiente o no existe.';
    END IF;

    -- Obtener datos originales para replicar
    SELECT S.idCliente, C.idProducto INTO v_idCliente, v_idProducto
    FROM Credito C
    JOIN SolicitudCredito S ON C.idSolicitud = S.idSolicitud
    WHERE C.idCredito = p_idCreditoViejo;

    START TRANSACTION;
        -- A. Dar por pagadas administrativo las cuotas viejas (o podrías crear estado 'Refinanciado')
        UPDATE Cuota SET idEstadoCuota = 2, usuarioModif = CONCAT('Refin: ', p_usuario)
        WHERE idCredito = p_idCreditoViejo AND idEstadoCuota != 2;

        -- B. Crear nueva solicitud "auto-aprobada"
        INSERT INTO SolicitudCredito (idCliente, idEmpleado, idProducto, idSucursalAlta, idEstadoSolicitud, montoSolicitado, destino, usuarioAlta)
        VALUES (v_idCliente, 1, v_idProducto, 1, 2, v_saldoDeudor, 'Refinanciación de Deuda', p_usuario);
        -- Nota: puse Empleado 1 y Sucursal 1 por defecto, idealmente pasarlo por parámetro.
        
        SET v_idNuevaSolicitud = LAST_INSERT_ID();

        -- C. Llamar al procedimiento de creación de crédito (Reutilizamos código!)
        -- Llamada interna al proc que ya creamos arriba
        CALL proc_AprobarCredito_GenerarCuotas(v_idNuevaSolicitud, v_saldoDeudor, p_nuevaTasa, p_nuevoPlazo, p_usuario);

        -- D. Vincular refinanciación
        -- Como proc_Aprobar... crea el crédito al final, necesitamos buscar el último insertado de esa solicitud
        SELECT idCredito INTO v_idNuevoCredito FROM Credito WHERE idSolicitud = v_idNuevaSolicitud LIMIT 1;
        
        UPDATE Credito SET idCreditoRefinanciado = p_idCreditoViejo WHERE idCredito = v_idNuevoCredito;

    COMMIT;
END$$

-- =============================================================================
-- 5. FUNCIÓN: fn_ObtenerEstadoMorosidad
-- Objetivo: Retornar estado del cliente según días de atraso real.
-- Usuario: Analista / Cobranzas
-- =============================================================================
DROP FUNCTION IF EXISTS fn_ObtenerEstadoMorosidad$$

CREATE FUNCTION fn_ObtenerEstadoMorosidad(p_idCliente INT) 
RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_maxDiasAtraso INT;
    DECLARE v_resultado VARCHAR(50);

    -- Buscar la cuota con mayor atraso de todos los créditos activos del cliente
    SELECT MAX(DATEDIFF(NOW(), C.fechaVencimiento))
    INTO v_maxDiasAtraso
    FROM Cuota C
    JOIN Credito CR ON C.idCredito = CR.idCredito
    JOIN SolicitudCredito S ON CR.idSolicitud = S.idSolicitud
    WHERE S.idCliente = p_idCliente
      AND C.idEstadoCuota != 2 -- No pagada
      AND C.fechaVencimiento < NOW(); -- Ya venció

    -- Lógica de clasificación
    IF v_maxDiasAtraso IS NULL THEN
        SET v_resultado = 'AL DÍA';
    ELSEIF v_maxDiasAtraso <= 30 THEN
        SET v_resultado = 'MORA LEVE';
    ELSEIF v_maxDiasAtraso > 30 THEN
        SET v_resultado = 'MORA GRAVE';
    END IF;

    RETURN v_resultado;
END$$

DELIMITER ;