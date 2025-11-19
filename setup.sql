

DROP DATABASE IF EXISTS SistemaCreditos;

SET NAMES utf8mb4;
CREATE DATABASE SistemaCreditos CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

USE SistemaCreditos;


CREATE TABLE Provincias (
    idProvincias INT AUTO_INCREMENT PRIMARY KEY,
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
    descripcion VARCHAR(100) NOT NULL,
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
    fechaInicio DATE,
    fechaFin DATE,
    resultados TEXT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);
 -- 1 a 500 pountaue reizgo
CREATE TABLE EvaluacionRiesgo (
    idEvaluacion INT AUTO_INCREMENT PRIMARY KEY,
    puntajeRiesgo INT NOT NULL, -- 1 a 500
    ingresosDeclaradosMensual DECIMAL(15,2),
    observaciones TEXT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50)
);

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
    idProvincia INT,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idProvincia) REFERENCES Provincias(idProvincias)
);

CREATE TABLE ProductoFinanciero (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    idTipoProducto INT,
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
    idEvaluacionActual INT NULL, 
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idEvaluacionActual) REFERENCES EvaluacionRiesgo(idEvaluacion)
);


CREATE TABLE Empleado (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    idSucursal INT,
    idTipoEmpleado INT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal),
    FOREIGN KEY (idTipoEmpleado) REFERENCES TipoEmpleado(idTipo)
);

CREATE TABLE HistoricoTasa (
    idTasa INT AUTO_INCREMENT PRIMARY KEY,
    idProducto INT,
    tasa DECIMAL(5,2) NOT NULL,
    fechaInicio DATE,
    fechaFin DATE,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto)
);

CREATE TABLE SolicitudCredito (
    idSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idEmpleado INT,
    idProducto INT,
    idSucursalAlta INT,
    idEstadoSolicitud INT,
    idEvaluacionRelevante INT,
    montoSolicitado DECIMAL(15,2),
    destino VARCHAR(255),
    fechaSolicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    fechaModif DATETIME ON UPDATE CURRENT_TIMESTAMP,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto),
    FOREIGN KEY (idSucursalAlta) REFERENCES Sucursal(idSucursal),
    FOREIGN KEY (idEstadoSolicitud) REFERENCES EstadoSolicitud(idEstado),
    FOREIGN KEY (idEvaluacionRelevante) REFERENCES EvaluacionRiesgo(idEvaluacion)
);

CREATE TABLE Credito (
    idCredito INT AUTO_INCREMENT PRIMARY KEY,
    idSolicitud INT,
    idProducto INT,
    idCreditoRefinanciado INT NULL,
    montoOtorgado DECIMAL(15,2),
    tasaInteres DECIMAL(5,2),
    plazoMeses INT,
    fechaInicio DATE,
    fechaFin DATE,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    fechaModif DATETIME ON UPDATE CURRENT_TIMESTAMP,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudCredito(idSolicitud),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto),
    FOREIGN KEY (idCreditoRefinanciado) REFERENCES Credito(idCredito)
);

CREATE TABLE Cuota (
    idCuota INT AUTO_INCREMENT PRIMARY KEY,
    idCredito INT,
    numeroCuota INT,
    fechaVencimiento DATE,
    montoTotal DECIMAL(15,2),
    idEstadoCuota INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCredito) REFERENCES Credito(idCredito),
    FOREIGN KEY (idEstadoCuota) REFERENCES EstadoCuota(idEstado)
);


CREATE TABLE Pago (
    idPago INT AUTO_INCREMENT PRIMARY KEY,
    idCuota INT,
    idMetodoPago INT,
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

CREATE TABLE Penalizacion (
    idPenalizacion INT AUTO_INCREMENT PRIMARY KEY,
    idCuota INT,
    montoPenalizacion DECIMAL(15,2),
    motivo VARCHAR(255),
    fechaAplicacion DATETIME,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCuota) REFERENCES Cuota(idCuota)
);


CREATE TABLE CampaniaProducto (
    idCampania INT,
    idProducto INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idCampania, idProducto),
    FOREIGN KEY (idCampania) REFERENCES CampaniaPromocional(idCampania),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto)
);

CREATE TABLE CampaniaCliente (
    idCampania INT,
    idCliente INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idCampania, idCliente),
    FOREIGN KEY (idCampania) REFERENCES CampaniaPromocional(idCampania),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE EvaluacionGarante (
    idEvaluacion INT,
    idGarante INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idEvaluacion, idGarante),
    FOREIGN KEY (idEvaluacion) REFERENCES EvaluacionRiesgo(idEvaluacion),
    FOREIGN KEY (idGarante) REFERENCES Garante(idGarante)
);

CREATE TABLE EvaluacionCliente (
    idEvaluacion INT,
    idCliente INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idEvaluacion, idCliente),
    FOREIGN KEY (idEvaluacion) REFERENCES EvaluacionRiesgo(idEvaluacion),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE GaranteSolicitud (
    idGarante INT,
    idSolicitud INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idGarante, idSolicitud),
    FOREIGN KEY (idGarante) REFERENCES Garante(idGarante),
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudCredito(idSolicitud)
);

