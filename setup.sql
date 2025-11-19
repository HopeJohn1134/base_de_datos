

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

CREATE TABLE CampañaPromocional (
    idCampaña INT AUTO_INCREMENT PRIMARY KEY,
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
CREATE TABLE EvaluaciónRiesgo (
    idEvaluación INT AUTO_INCREMENT PRIMARY KEY,
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
    idEvaluaciónActual INT NULL, 
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
    FOREIGN KEY (idEvaluaciónActual) REFERENCES EvaluaciónRiesgo(idEvaluación)
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

CREATE TABLE SolicitudCrédito (
    idSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idEmpleado INT,
    idProducto INT,
    idSucursalAlta INT,
    idEstadoSolicitud INT,
    idEvaluaciónRelevante INT,
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
    FOREIGN KEY (idEvaluaciónRelevante) REFERENCES EvaluaciónRiesgo(idEvaluación)
);

CREATE TABLE Crédito (
    idCrédito INT AUTO_INCREMENT PRIMARY KEY,
    idSolicitud INT,
    idProducto INT,
    idCréditoRefinanciado INT NULL,
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
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudCrédito(idSolicitud),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto),
    FOREIGN KEY (idCréditoRefinanciado) REFERENCES Crédito(idCrédito)
);

CREATE TABLE Cuota (
    idCuota INT AUTO_INCREMENT PRIMARY KEY,
    idCrédito INT,
    numeroCuota INT,
    fechaVencimiento DATE,
    montoTotal DECIMAL(15,2),
    idEstadoCuota INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCrédito) REFERENCES Crédito(idCrédito),
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

CREATE TABLE Penalización (
    idPenalización INT AUTO_INCREMENT PRIMARY KEY,
    idCuota INT,
    montoPenalización DECIMAL(15,2),
    motivo VARCHAR(255),
    fechaAplicacion DATETIME,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    FOREIGN KEY (idCuota) REFERENCES Cuota(idCuota)
);


CREATE TABLE CampañaProducto (
    idCampaña INT,
    idProducto INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idCampaña, idProducto),
    FOREIGN KEY (idCampaña) REFERENCES CampañaPromocional(idCampaña),
    FOREIGN KEY (idProducto) REFERENCES ProductoFinanciero(idProducto)
);

CREATE TABLE CampañaCliente (
    idCampaña INT,
    idCliente INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idCampaña, idCliente),
    FOREIGN KEY (idCampaña) REFERENCES CampañaPromocional(idCampaña),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE EvaluaciónGarante (
    idEvaluación INT,
    idGarante INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idEvaluación, idGarante),
    FOREIGN KEY (idEvaluación) REFERENCES EvaluaciónRiesgo(idEvaluación),
    FOREIGN KEY (idGarante) REFERENCES Garante(idGarante)
);

CREATE TABLE EvaluaciónCliente (
    idEvaluación INT,
    idCliente INT,
    fechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaBaja DATETIME NULL,
    usuarioAlta VARCHAR(50),
    usuarioModif VARCHAR(50),
    PRIMARY KEY (idEvaluación, idCliente),
    FOREIGN KEY (idEvaluación) REFERENCES EvaluaciónRiesgo(idEvaluación),
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
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudCrédito(idSolicitud)
);

