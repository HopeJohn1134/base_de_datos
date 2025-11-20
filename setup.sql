DROP DATABASE IF EXISTS SistemaCreditos;

SET NAMES utf8mb4;
CREATE DATABASE SistemaCreditos CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

USE SistemaCreditos;


CREATE TABLE Provincia (
    idProvincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE EstadoSolicitud (
    idEstado INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(50) NOT NULL, 
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE EstadoCuota (
    idEstado INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(50) NOT NULL, 
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE MetodoPago (
    idMetodo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100),
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE TipoProductoFinanciero (
    idTipo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE TipoEmpleado (
    idTipo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE CampaniaPromocional (
    idCampania INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    resultados TEXT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE EvaluacionRiesgo (
    idEvaluacion INT AUTO_INCREMENT PRIMARY KEY,
	puntajeRiesgo INT NOT NULL CHECK (puntajeRiesgo BETWEEN 1 AND 500),
    ingresosDeclaradosMensual DECIMAL(15,2),
    observaciones TEXT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);
CREATE INDEX idx_evaluacion_riesgo_ingresos ON EvaluacionRiesgo(puntajeRiesgo, ingresosDeclaradosMensual);

CREATE TABLE Garante (
    idGarante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    observaciones TEXT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

CREATE TABLE Sucursal (
    idSucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idProvincia INT NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idProvincia) REFERENCES Provincia(idProvincia)
);

CREATE TABLE ProductoFinanciero (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    idTipoProducto INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    requisitos TEXT,
    limiteCrediticio DECIMAL(15,2),
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idTipoProducto) REFERENCES TipoProductoFinanciero(idTipo)
);

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);
CREATE INDEX idx_cliente_apellido_nombre ON Cliente(apellido, nombre);


CREATE TABLE Empleado (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    idSucursal INT,
    idTipoEmpleado INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal),
    FOREIGN KEY (idTipoEmpleado) REFERENCES TipoEmpleado(idTipo)
);

CREATE TABLE HistoricoTasa (
    idTasa INT AUTO_INCREMENT PRIMARY KEY,
    idProducto INT NOT NULL,
    tasa DECIMAL(5,2) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto)
);

CREATE TABLE SolicitudCredito (
    idSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idEmpleado INT NOT NULL,
    idProducto INT NOT NULL,
    idEstadoSolicitud INT NOT NULL,
    idEvaluacionRelevante INT NOT NULL,
    montoSolicitado DECIMAL(15,2) NOT NULL,
    destino TEXT,
    fechaSolicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto),
    FOREIGN KEY (idEstadoSolicitud) REFERENCES EstadoSolicitud(idEstado),
    FOREIGN KEY (idEvaluacionRelevante) REFERENCES EvaluacionRiesgo(idEvaluacion)
);
CREATE INDEX idx_solicitud_fecha ON SolicitudCredito(fechaSolicitud);

CREATE TABLE Credito (
    idCredito INT AUTO_INCREMENT PRIMARY KEY,
    idSolicitud INT NOT NULL,
    idProducto INT NOT NULL,
    idCreditoRefinanciado INT DEFAULT NULL,
    montoOtorgado DECIMAL(15,2) NOT NULL,
    tasaInteres DECIMAL(5,2) NOT NULL,
    plazoMeses INT NOT NULL,
    fechaInicio DATE,
    fechaFin DATE,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudCredito(idSolicitud),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto),
    FOREIGN KEY (idCreditoRefinanciado) REFERENCES Credito(idCredito)
);

CREATE TABLE Cuota (
    idCuota INT AUTO_INCREMENT PRIMARY KEY,
    idCredito INT NOT NULL,
    idEstadoCuota INT NOT NULL,
    numeroCuota INT NOT NULL,
    fechaVencimiento DATE,
    montoTotal DECIMAL(15,2),
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCredito) REFERENCES Credito(idCredito),
    FOREIGN KEY (idEstadoCuota) REFERENCES EstadoCuota(idEstado)
);
CREATE INDEX idx_cuota_estado_vencimiento ON Cuota(idEstadoCuota, fechaVencimiento);


CREATE TABLE Pago (
    idPago INT AUTO_INCREMENT PRIMARY KEY,
    idCuota INT NOT NULL,
    idMetodoPago INT NOT NULL,
    fechaPago DATETIME DEFAULT CURRENT_TIMESTAMP,
    montoPagado DECIMAL(15,2),
    diasDemora INT DEFAULT 0,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCuota) REFERENCES Cuota(idCuota),
    FOREIGN KEY (idMetodoPago) REFERENCES MetodoPago(idMetodo)
);
CREATE INDEX idx_pago_metodo ON Pago(idMetodoPago);

CREATE TABLE Penalizacion (
    idPenalizacion INT AUTO_INCREMENT PRIMARY KEY,
    idCuota INT NOT NULL,
    montoPenalizacion DECIMAL(15,2) NOT NULL,
    motivo VARCHAR(255),
    fechaAplicacion DATETIME,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCuota) REFERENCES Cuota(idCuota)
);


/*
///// TABLAS DE INTERMEDIAS/INTERSECCIÓN/UNIÓN /////
*/

CREATE TABLE CampaniaProducto (
    idCampaniaProducto INT AUTO_INCREMENT PRIMARY KEY,
    idCampania INT NOT NULL,
    idProducto INT NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCampania) REFERENCES CampaniaPromocional(idCampania),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto)
);

CREATE TABLE CampaniaCliente (
    idCampaniaCliente INT AUTO_INCREMENT PRIMARY KEY,
    idCampania INT NOT NULL,
    idCliente INT NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCampania) REFERENCES CampaniaPromocional(idCampania),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE EvaluacionGarante (
    idEvaluacionGarante INT AUTO_INCREMENT PRIMARY KEY,
    idEvaluacion INT NOT NULL,
    idGarante INT NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idEvaluacion) REFERENCES EvaluacionRiesgo(idEvaluacion),
    FOREIGN KEY (idGarante) REFERENCES Garante(idGarante)
);

CREATE TABLE EvaluacionCliente (
    idEvaluacionCliente INT AUTO_INCREMENT PRIMARY KEY,
    idEvaluacion INT NOT NULL,
    idCliente INT NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idEvaluacion) REFERENCES EvaluacionRiesgo(idEvaluacion),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE GaranteSolicitud (
    idGaranteSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    idGarante INT NOT NULL,
    idSolicitud INT NOT NULL,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idGarante) REFERENCES Garante(idGarante),
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudCredito(idSolicitud)
);

