use SistemaCreditos;
-- Provincia
INSERT INTO
    Provincia (nombre)
VALUES
    ('Buenos Aires');
INSERT INTO
    Provincia (nombre)
VALUES
    ('Ciudad Autónoma de Buenos Aires');
INSERT INTO
    Provincia (nombre)
VALUES
    ('Catamarca'),
    ('Chaco'),
    ('Chubut'),
    ('Córdoba'),
    ('Corrientes'),
    ('Entre Ríos'),
    ('Formosa'),
    ('Jujuy'),
    ('La Pampa'),
    ('La Rioja'),
    ('Mendoza'),
    ('Misiones'),
    ('Neuquén'),
    ('Río Negro'),
    ('Salta'),
    ('San Juan'),
    ('San Luis'),
    ('Santa Cruz'),
    ('Santa Fe'),
    ('Santiago del Estero');
INSERT INTO
    Provincia (nombre)
VALUES
    ('Tierra del Fuego, Antártida e Islas del Atlántico Sur');
-- estadosolicitud
INSERT INTO
    EstadoSolicitud (estado)
VALUES
    ('Pendiente de Evaluación'),
    ('Aprobada'),
    ('Rechazada'),
    ('En Revisión');
-- EstadoCuota
INSERT INTO
    EstadoCuota (estado)
VALUES
    ('Pendiente'),
    ('Pagada'),
    ('Vencida');
-- MetodoPago
INSERT INTO
    MetodoPago (descripcion)
VALUES
    ('Transferencia Bancaria'),
    ('Débito Automático'),
    ('Efectivo en Sucursal'),
    ('Cheque'),
    ('Billetera Virtual');
-- TipoProductoFinanciero
INSERT INTO
    TipoProductoFinanciero (tipo)
VALUES
    ('Préstamo Personal'),
    ('Préstamo Hipotecario'),
    ('Préstamo Empresarial'),
    ('Leasing'),
    ('Tarjeta Corporativa');
-- TipoEmpleado
INSERT INTO
    TipoEmpleado (tipo)
VALUES
    ('Atención al Cliente'),
    ('Analista Crediticio'),
    ('Gestor de Cobranza'),
    ('Gerente de Sucursal'),
    ('Administrativo/Caja');
-- Inserts para la tabla CampaniaPromocional (10 registros)
INSERT INTO
    CampaniaPromocional (nombre, descripcion, fechaInicio, fechaFin, resultados)
VALUES
    ('Lanzamiento Primavera 2025', 'Tasa reducida para préstamos personales de hasta $100.000.', '2025-09-01', '2025-10-31', 'Pendiente de análisis'),
    ('Crédito Joven Empresario', 'Préstamos empresariales con 6 meses de gracia para emprendedores menores de 30 años.', '2025-05-15', '2025-08-15', '250 solicitudes recibidas.'),
    ('Refinancia y Ahorra', 'Campania dirigida a clientes activos con buen historial para refinanciar créditos con mejor tasa.', '2025-01-01', '2025-12-31', 'En curso'),
    ('Hipotecario Tasa Fija', 'Tasa fija preferencial para los primeros 5 años de un préstamo hipotecario.', '2025-03-01', '2025-04-30', '15 hipotecas aprobadas.'),
    ('Black Friday Financiero', 'Descuentos en tasas de interés durante el mes de noviembre.', '2025-11-01', '2025-11-30', 'Pendiente de ejecución'),
    ('Día del Padre PyME', 'Beneficios y plazos extendidos en créditos PyME durante junio.', '2025-06-01', '2025-06-30', 'Finalizada, buen impacto en ventas.'),
    ('Vuelta al Colegio Crédito', 'Préstamos personales de bajo monto para gastos escolares.', '2025-02-01', '2025-03-15', 'Muy exitosa. Alta demanda.'),
    ('Tarjeta C. Beneficio Cero', 'Promoción de 3 meses sin intereses en nuevas Tarjetas Corporativas.', '2025-07-20', '2025-10-20', 'Baja respuesta inicial.'),
    ('Inversión Agro 2025', 'Línea de crédito especial para el sector agropecuario con tasas subsidiadas.', '2025-04-01', '2025-09-30', 'Impacto medio en Provincia del interior.'),
    ('Préstamo Digital Express', 'Proceso de solicitud 100% online con aprobación en 24hs.', '2025-10-01', '2026-03-31', 'En curso');
-- EvaluacionRiesgo
-- PuntajeRiesgo: 1 (riesgo bajo/excelente) a 500 (riesgo alto)
INSERT INTO
    EvaluacionRiesgo (puntajeRiesgo, ingresosDeclaradosMensual, observaciones)
VALUES
    (150, 150000.00, 'Cliente con perfil estable, historial de pagos impecable.'),
    (450, 35000.00, 'Ingresos bajos, historial de endeudamiento anterior. ALERTA ALTA.'),
    (25, 450000.00, 'Ingresos muy altos, excelente puntaje. Aprobación rápida.'),
    (280, 80000.00, 'Puntaje medio, dependiente de la relación cuota-ingreso.'),
    (90, 220000.00, 'Buen perfil, ingresos verificables.'),
    (50, 310000.00, 'Garante con alta capacidad de pago. Riesgo Mínimo.'),
    (380, 55000.00, 'Perfil de alto riesgo, considerar garante adicional.'),
    (120, 180000.00, 'Cliente corporativo, riesgo moderado-bajo.'),
    (30, 600000.00, 'Ingresos superiores, puntaje ideal.'),
    (210, 95000.00, 'Riesgo moderado, requiere verificación de domicilio.'),
    (480, 40000.00, 'Máximo riesgo. Solo para créditos de muy bajo monto.'),
    (10, 850000.00, 'Puntaje perfecto. Cliente Premium.'),
    (170, 130000.00, 'Riesgo bajo, primera solicitud de crédito.'),
    (330, 65000.00, 'Riesgo significativo. Solicitud pendiente de aprobación de gerente.'),
    (60, 270000.00, 'Garante sólido, ingresos altos.'),
    (240, 75000.00, 'Puntaje intermedio, sin deudas vigentes.'),
    (190, 110000.00, 'Riesgo normal para un préstamo personal.'),
    (420, 48000.00, 'Riesgo alto debido a historial de morosidad.'),
    (45, 520000.00, 'Cliente con alto patrimonio, excelente respaldo.'),
    (260, 88000.00, 'Evaluación de seguimiento. Puntaje se mantuvo.'),
    (130, 165000.00, 'Riesgo aceptable para crédito hipotecario.'),
    (390, 52000.00, 'Puntaje crítico, la solicitud debería ser rechazada.'),
    (75, 250000.00, 'Garante con ingresos excelentes y estables.'),
    (290, 70000.00, 'Evaluación de un cliente activo con historial reciente de mora.'),
    (20, 950000.00, 'Puntaje élite, ingreso declarado máximo.'),
    (310, 68000.00, 'Riesgo sub-estándar, solo para refinanciación.'),
    (110, 195000.00, 'Perfil muy bueno, ideal para productos corporativos.'),
    (460, 38000.00, 'Evaluación de seguimiento. El riesgo aumentó.'),
    (180, 125000.00, 'Puntaje estable. Historial verificado.'),
    (55, 330000.00, 'Riesgo muy bajo. Solicitud de leasing.'),
    (350, 60000.00, 'Alto riesgo. El garante es clave en esta solicitud.'),
    (220, 105000.00, 'Riesgo medio. Solicitud pendiente de documentos.'),
    (15, 750000.00, 'Puntaje casi perfecto. Cliente con muchos años en el banco.'),
    (410, 42000.00, 'Historial de rechazos. No apto para nuevos créditos.'),
    (140, 155000.00, 'Perfil bueno. Sin problemas de endeudamiento.'),
    (320, 62000.00, 'Riesgo por inestabilidad laboral reciente.'),
    (85, 235000.00, 'Garante de alto valor. Ingresos superiores a la media.'),
    (270, 83000.00, 'Riesgo medio-alto. Cuota mensual será elevada.'),
    (35, 550000.00, 'Riesgo muy bajo, ingresos por renta.'),
    (430, 46000.00, 'Evaluación para un cliente con mora en otra institución.'),
    (100, 205000.00, 'Perfil sólido. Ideal para tarjetas corporativas.'),
    (370, 58000.00, 'Riesgo alto. Solo para productos con aval.'),
    (70, 280000.00, 'Garante con excelente perfil crediticio.'),
    (250, 90000.00, 'Puntaje promedio. Sin problemas ni beneficios notables.'),
    (500, 30000.00, 'Puntaje de riesgo MÁXIMO. Rechazo automático.'),
    (10, 1200000.00, 'Puntaje de riesgo Mínimo. Ingresos muy altos.'),
    (160, 145000.00, 'Riesgo bajo. Aprobado para préstamo personal.'),
    (340, 63000.00, 'Riesgo alto. Historial de dos refinanciaciones.'),
    (80, 265000.00, 'Buen perfil. Ingresos estables y verificados.'),
    (230, 98000.00, 'Puntaje medio. Necesita un garante de buen perfil.'),
    (195, 115000.00, 'Riesgo normal. Aprobación estándar.'),
    (400, 44000.00, 'Riesgo muy alto. Ingresos mínimos.'),
    (50, 500000.00, 'Garante con patrimonio importante.'),
    (295, 72000.00, 'Puntaje por debajo del límite de aprobación sin garante.'),
    (125, 175000.00, 'Riesgo aceptable para crédito PyME.'),
    (440, 41000.00, 'Riesgo alto. Score bajo en sistema externo.'),
    (65, 300000.00, 'Garante con ingresos excelentes.'),
    (200, 110000.00, 'Riesgo neutro. El proceso continúa.'),
    (490, 32000.00, 'Riesgo crítico. Solicitud solo viable con prenda.'),
    (105, 185000.00, 'Perfil sólido. Cliente con alta fidelidad.');
-- Garante
INSERT INTO
    Garante (nombre, apellido, dni, email, observaciones)
VALUES
    ('Juan', 'Perez', '10111221', 'juan.perez.g1@mail.com', 'Garante principal, historial laboral excelente.'),
    ('Maria', 'Gomez', '11222332', 'maria.gomez.g2@mail.com', 'Aporta ingresos complementarios.'),
    ('Carlos', 'Lopez', '12333443', 'carlos.lopez.g3@mail.com', 'Dueño de negocio, fácil verificación.'),
    ('Ana', 'Martinez', '13444554', 'ana.martinez.g4@mail.com', 'Pariente directo del solicitante.'),
    ('Pedro', 'Rodriguez', '14555665', 'pedro.rodriguez.g5@mail.com', 'Trabajador independiente, requiere más documentación.'),
    ('Laura', 'Fernandez', '15666776', 'laura.fernandez.g6@mail.com', 'Garante por refinanciación anterior.'),
    ('Javier', 'Diaz', '16777887', 'javier.diaz.g7@mail.com', 'Primer garante, sin experiencia previa.'),
    ('Sofia', 'Sanchez', '17888998', 'sofia.sanchez.g8@mail.com', 'Propietaria de inmueble. Bajo riesgo.'),
    ('Diego', 'Ramirez', '18999009', 'diego.ramirez.g9@mail.com', 'Ingresos por alquileres.'),
    ('Valeria', 'Torres', '19000110', 'valeria.torres.g10@mail.com', 'Historial crediticio limpio.'),
    ('Pablo', 'Acosta', '20111220', 'pablo.acosta.g11@mail.com', 'Garante joven, empleado en relación de dependencia.'),
    ('Lucia', 'Benitez', '21222331', 'lucia.benitez.g12@mail.com', 'Profesional con ingresos sólidos.'),
    ('Manuel', 'Cano', '22333442', 'manuel.cano.g13@mail.com', 'Aceptado solo para créditos personales.'),
    ('Elena', 'Delgado', '23444553', 'elena.delgado.g14@mail.com', 'Garante para crédito PyME.'),
    ('Ricardo', 'Esposito', '24555664', 'ricardo.esposito.g15@mail.com', 'Historial de pagos regulares.'),
    ('Andrea', 'Flores', '25666775', 'andrea.flores.g16@mail.com', 'Primer garante del grupo.'),
    ('Gustavo', 'Gallo', '26777886', 'gustavo.gallo.g17@mail.com', 'Revisión periódica de ingresos.'),
    ('Natalia', 'Herrera', '27888997', 'natalia.herrera.g18@mail.com', 'Garante de alto valor para hipotecario.'),
    ('Jorge', 'Ibañez', '28999008', 'jorge.ibanez.g19@mail.com', 'Garante con puntaje de riesgo bajo.'),
    ('Emilia', 'Juarez', '29000119', 'emilia.juarez.g20@mail.com', 'Observaciones: Pendiente de confirmación de ingresos.'),
    ('Federico', 'Kaufman', '30111228', 'federico.kaufman.g21@mail.com', 'Garante para tarjeta corporativa.'),
    ('Mariana', 'Ledesma', '31222337', 'mariana.ledesma.g22@mail.com', 'Solicitante recurrente de garantías.'),
    ('Alejandro', 'Molina', '32333446', 'alejandro.molina.g23@mail.com', 'Ingresos declarados altos.'),
    ('Carla', 'Navarro', '33444555', 'carla.navarro.g24@mail.com', 'Garante por préstamo a familiar.'),
    ('Roberto', 'Ortiz', '34555664', 'roberto.ortiz.g25@mail.com', 'Perfil estable, jubilado con ingresos altos.'),
    ('Florencia', 'Paz', '35666773', 'florencia.paz.g26@mail.com', 'Aceptada después de segunda revisión.'),
    ('Hernan', 'Quinteros', '36777882', 'hernan.quinteros.g27@mail.com', 'Garante de empresa, excelente respaldo.'),
    ('Silvina', 'Rojas', '37888991', 'silvina.rojas.g28@mail.com', 'Primer contacto como garante.'),
    ('Guillermo', 'Sosa', '38999000', 'guillermo.sosa.g29@mail.com', 'Historial de buen comportamiento crediticio.'),
    ('Viviana', 'Tapia', '39000119', 'viviana.tapia.g30@mail.com', 'Ingresos por monotributo, riesgo moderado.'),
    ('Facundo', 'Uribe', '40111228', 'facundo.uribe.g31@mail.com', 'Garante con alto nivel de liquidez.'),
    ('Julieta', 'Vazquez', '41222337', 'julieta.vazquez.g32@mail.com', 'Observaciones: Riesgo alto, se aceptó por puntaje del cliente.'),
    ('Marcelo', 'Winkler', '42333446', 'marcelo.winkler.g33@mail.com', 'Ingresos por trabajo en el exterior.'),
    ('Erika', 'Xavier', '43444555', 'erika.xavier.g34@mail.com', 'Garante por préstamo personal.'),
    ('Nicolas', 'Yañez', '44555664', 'nicolas.yanez.g35@mail.com', 'Garante para renovación de crédito.'),
    ('Paula', 'Zarate', '45666773', 'paula.zarate.g36@mail.com', 'Perfil de muy bajo riesgo.'),
    ('Santiago', 'Alvarez', '46777882', 'santiago.alvarez.g37@mail.com', 'Garante de una PyME.'),
    ('Romina', 'Blanco', '47888991', 'romina.blanco.g38@mail.com', 'Ingresos declarados justo en el límite.'),
    ('Martin', 'Castro', '48999000', 'martin.castro.g39@mail.com', 'Garante por leasing de maquinaria.'),
    ('Veronica', 'Dominguez', '49000119', 'veronica.dominguez.g40@mail.com', 'Garante para crédito a largo plazo.'),
    ('Mauro', 'Estevez', '50111228', 'mauro.estevez.g41@mail.com', 'Historial de garantías sin ejecución.'),
    ('Cecilia', 'Gimenez', '51222337', 'cecilia.gimenez.g42@mail.com', 'Observaciones: Solicitante y garante son socios.'),
    ('Elias', 'Hidalgo', '52333446', 'elias.hidalgo.g43@mail.com', 'Garante con propiedad hipotecada.'),
    ('Antonella', 'Iriarte', '53444555', 'antonella.iriarte.g44@mail.com', 'Riesgo moderado.'),
    ('Hugo', 'Jimenez', '54555664', 'hugo.jimenez.g45@mail.com', 'Garante de crédito renovado.'),
    ('Gabriela', 'Lencina', '55666773', 'gabriela.lencina.g46@mail.com', 'Ingresos estables, empleada pública.'),
    ('Ramiro', 'Mendez', '56777882', 'ramiro.mendez.g47@mail.com', 'Garante con buen respaldo financiero.'),
    ('Melisa', 'Nuñez', '57888991', 'melisa.nunez.g48@mail.com', 'Garante para préstamo educativo.'),
    ('Ivan', 'Olivera', '58999000', 'ivan.olivera.g49@mail.com', 'Garante para microcrédito.'),
    ('Natalia', 'Peralta', '59000119', 'natalia.peralta.g50@mail.com', 'Ingresos verificados y altos.'),
    ('Alfredo', 'Quiroga', '60111228', 'alfredo.quiroga.g51@mail.com', 'Garante con puntaje de riesgo bajo.'),
    ('Brenda', 'Rivas', '61222337', 'brenda.rivas.g52@mail.com', 'Garante para solicitud aprobada recientemente.'),
    ('Cristian', 'Salas', '62333446', 'cristian.salas.g53@mail.com', 'Observaciones: Segundo garante de la solicitud.'),
    ('Denise', 'Toledo', '63444555', 'denise.toledo.g54@mail.com', 'Garante con ingresos por jubilación.'),
    ('Esteban', 'Ugarte', '64555664', 'esteban.ugarte.g55@mail.com', 'Garante por crédito hipotecario.'),
    ('Fabiola', 'Vera', '65666773', 'fabiola.vera.g56@mail.com', 'Garante para cliente nuevo.'),
    ('Hector', 'Zelaya', '66777882', 'hector.zelaya.g57@mail.com', 'Garante para PyME con antigüedad.'),
    ('Irene', 'Alonso', '67888991', 'irene.alonso.g58@mail.com', 'Ingresos por renta pasiva.'),
    ('Lucas', 'Bustos', '68999000', 'lucas.bustos.g59@mail.com', 'Garante con excelente perfil.'),
    ('Monica', 'Cortes', '69000119', 'monica.cortes.g60@mail.com', 'Garante de bajo riesgo, sin problemas previos.');
--  Sucursal
-- Se usan idProvincia 1 (Buenos Aires), 6 (Córdoba), 13 (Mendoza), 21 (Santa Fe), 2 (CABA)
INSERT INTO
    Sucursal (nombre, idProvincia, telefono, direccion)
VALUES
    ('Sucursal Central Buenos Aires', 1, '1145678900', 'Av. 9 de Julio 1000'),
    ('Sucursal Córdoba Norte', 6, '3514445555', 'Bv. San Juan 50'),
    ('Sucursal Mendoza Capital', 13, '2615556666', 'Calle Sarmiento 1200'),
    ('Sucursal Rosario', 21, '3416667777', 'Peatonal Córdoba 980'),
    ('Sucursal CABA Microcentro', 2, '1177778888', 'Florida 400');
-- pructoFinanciero
-- TIPO 1: Préstamo Personal (12 registros)
INSERT INTO
    ProductoFinanciero (idTipoProducto, nombre, requisitos, limiteCrediticio)
VALUES
    (1, 'Préstamo Express 12M', 'Antigüedad laboral min. 6 meses, DNI, sin mora previa.', 150000.00),
    (1, 'Préstamo Personal 24M', 'Antigüedad laboral min. 1 año, Ingreso min. $80.000.', 300000.00),
    (1, 'Préstamo Sueldo Garantizado', 'Débito automático en cuenta, relación de dependencia.', 500000.00),
    (1, 'Préstamo Joven Profesional', 'Título universitario, menos de 30 años, buen puntaje de riesgo.', 250000.00),
    (1, 'Préstamo Familiar', 'Tasa reducida para clientes con historial de 5 años.', 600000.00),
    (1, 'Crédito Consumo Básico', 'Monto bajo, ideal para nuevos clientes. Plazo máx 6 meses.', 80000.00),
    (1, 'Préstamo Vacaciones', 'Aplica solo de Diciembre a Marzo. Ingreso min. $120.000.', 200000.00),
    (1, 'Préstamo Salud y Educación', 'Requiere presentación de facturas de gastos comprobables.', 400000.00),
    (1, 'Préstamo Rápido Online', 'Aprobación digital en 24hs. Límite hasta $100.000.', 100000.00),
    (1, 'Préstamo Personal Premium', 'Para clientes con Score de riesgo < 50.', 800000.00),
    (1, 'Préstamo Púbico', 'Exclusivo para empleados de la administración pública.', 750000.00),
    (1, 'Préstamo Libre Disponibilidad', 'Sin justificación de destino. Ingreso min. $150.000.', 450000.00);
-- TIPO 2: Préstamo Hipotecario (12 registros)
INSERT INTO
    ProductoFinanciero (idTipoProducto, nombre, requisitos, limiteCrediticio)
VALUES
    (2, 'Hipotecario Vivienda Única 20A', 'Relación cuota-ingreso 30%, Proforma de bien inmueble.', 15000000.00),
    (2, 'Hipotecario Propietario', 'Para adquisición de segunda vivienda. Tasa más alta.', 10000000.00),
    (2, 'Hipotecario Refacción', 'Máximo 5 años de plazo. Se requiere presupuesto de obra.', 2000000.00),
    (2, 'Hipotecario Tasa Fija 10A', 'Garantía real, seguro de vida obligatorio.', 12000000.00),
    (2, 'Hipotecario UVA', 'Sujeto a variación por índice de inflación. Plazo 30 años.', 25000000.00),
    (2, 'Hipotecario Construcción', 'Desembolsos parciales sujetos a avance de obra.', 8000000.00),
    (2, 'Hipotecario Tasa Variable', 'Tasa atada a la tasa de referencia BCRA.', 18000000.00),
    (2, 'Hipotecario Plus', 'Para clientes con historial crediticio impecable.', 30000000.00),
    (2, 'Hipotecario Exterior', 'Para compra de propiedades en países limítrofes. Requiere garante local.', 7000000.00),
    (2, 'Hipotecario Simplificado', 'Para montos menores al 50% del valor del inmueble.', 5000000.00),
    (2, 'Hipotecario Compra Colectiva', 'Para desarrollos inmobiliarios específicos.', 9000000.00),
    (2, 'Hipotecario Verde', 'Para propiedades con certificación de eficiencia energética.', 11000000.00);
-- TIPO 3: Préstamo Empresarial (12 registros)
INSERT INTO
    ProductoFinanciero (idTipoProducto, nombre, requisitos, limiteCrediticio)
VALUES
    (3, 'Crédito PyME Capital de Trabajo', 'Balance de los últimos 2 ejercicios, min. 3 años de antigüedad.', 4000000.00),
    (3, 'Crédito PyME Inversión', 'Presentación de proyecto y flujo de fondos.', 10000000.00),
    (3, 'Línea de Crédito Rotatoria', 'Garantía prendaria o hipotecaria. Uso recurrente.', 3000000.00),
    (3, 'Préstamo Agropecuario Cosecha', 'Exclusivo para productores agropecuarios. Tasa subsidiada.', 5000000.00),
    (3, 'Crédito MiPyME Exportador', 'Requiere facturas de exportación como garantía.', 7000000.00),
    (3, 'Préstamo Empresarial Nuevo', 'Para empresas con menos de 1 año de operación. Requiere aval.', 1500000.00),
    (3, 'Préstamo Servicios', 'Específico para empresas de servicios profesionales.', 2500000.00),
    (3, 'Crédito Franquicia', 'Financiación para apertura de nueva franquicia.', 3500000.00),
    (3, 'Crédito Comercial Dólares', 'Sujeto a tipo de cambio oficial.', 5000000.00),
    (3, 'Préstamo Tecnológico', 'Para adquisición de software y hardware. Plazo corto.', 2000000.00),
    (3, 'Préstamo Sustentable', 'Para proyectos con impacto ambiental positivo.', 4500000.00),
    (3, 'Préstamo Proveedores', 'Para pagar a proveedores, con garantía de cuentas por cobrar.', 6000000.00);
-- TIPO 4: Leasing (12 registros)
INSERT INTO
    ProductoFinanciero (idTipoProducto, nombre, requisitos, limiteCrediticio)
VALUES
    (4, 'Leasing Vehículos Utilitarios', 'Contrato de 36 a 60 meses. Opción de compra al final.', 4000000.00),
    (4, 'Leasing Maquinaria Industrial', 'Requiere seguro contra todo riesgo.', 8000000.00),
    (4, 'Leasing Inmobiliario Comercial', 'Para oficinas o locales. Plazo máx. 10 años.', 15000000.00),
    (4, 'Leasing Equipamiento Médico', 'Mínimo 24 meses. Dirigido a clínicas y hospitales.', 5000000.00),
    (4, 'Leasing Flota de Autos', 'Para empresas con gran demanda de movilidad.', 6000000.00),
    (4, 'Leasing Tecnológico', 'Actualización de equipos cada 18 meses.', 1500000.00),
    (4, 'Leasing Agrícola', 'Para tractores y cosechadoras. Pago ajustado a ciclo de cosecha.', 7500000.00),
    (4, 'Leasing de Software', 'Para licencias y programas de alto costo.', 2500000.00),
    (4, 'Leasing de Construcción', 'Para grúas, excavadoras, etc.', 9000000.00),
    (4, 'Leasing Financiero', 'Enfoque en la opción de compra.', 4500000.00),
    (4, 'Leasing Operativo', 'Enfoque en el uso y devolución al final.', 3000000.00),
    (4, 'Leasing de Transporte Pesado', 'Para camiones y buses de larga distancia.', 10000000.00);
-- TIPO 5: Tarjeta Corporativa (12 registros)
INSERT INTO
    ProductoFinanciero (idTipoProducto, nombre, requisitos, limiteCrediticio)
VALUES
    (5, 'Tarjeta Corporate Oro', 'Facturación anual min. $5M, 5 años de antigüedad.', 2000000.00),
    (5, 'Tarjeta PyME Base', 'Para pequeñas y medianas empresas. Límite compartido.', 500000.00),
    (5, 'Tarjeta Business Black', 'Alto límite, beneficios exclusivos de viaje.', 5000000.00),
    (5, 'Tarjeta Flota Combustible', 'Uso limitado a estaciones de servicio y peajes.', 300000.00),
    (5, 'Tarjeta Corporativa Servicios', 'Para gastos de representación y hotelería.', 1000000.00),
    (5, 'Tarjeta Startup', 'Para empresas de reciente creación. Límite conservador.', 250000.00),
    (5, 'Tarjeta Monotributista', 'Dirigida a profesionales independientes.', 400000.00),
    (5, 'Tarjeta Premium Viajes', 'Acumulación de millas x dólar gastado.', 1500000.00),
    (5, 'Tarjeta Compra Mayorista', 'Especializada en grandes volúmenes de compra.', 750000.00),
    (5, 'Tarjeta Verde Corporativa', 'Beneficios por consumo en comercios sostenibles.', 900000.00),
    (5, 'Tarjeta Digital Empresarial', 'Solo virtual, para pagos en línea.', 600000.00),
    (5, 'Tarjeta Cuentas por Pagar', 'Para centralizar pagos a proveedores.', 1200000.00);
-- Cliente
INSERT INTO
    Cliente (nombre, apellido, dni, direccion, telefono, email)
VALUES
    ('Agustin', 'Alvarez', '20111222', 'Rivadavia 100, CABA', '1140001001', 'agustin.alvarez.c1@mail.com'),
    ('Belen', 'Blanco', '21222333', 'San Martin 200, Córdoba', '35140001002', 'belen.blanco.c2@mail.com'),
    ('Cesar', 'Castro', '22333444', 'Salta 300, Rosario', '34140001003', 'cesar.castro.c3@mail.com'),
    ('Daniela', 'Díaz', '23444555', 'Mitre 400, Mendoza', '26140001004', 'daniela.diaz.c4@mail.com'),
    ('Elias', 'Estevez', '24555666', 'Corrientes 500, Posadas', '37640001005', 'elias.estevez.c5@mail.com'),
    ('Florencia', 'Fernández', '25666777', 'Libertad 600, Tucumán', '38140001006', 'florencia.fernandez.c6@mail.com'),
    ('Gabriel', 'Giménez', '26777888', 'Av. Colón 700, Salta', '38740001007', 'gabriel.gimenez.c7@mail.com'),
    ('Helena', 'Herrera', '27888999', 'Belgrano 800, La Plata', '22140001008', 'helena.herrera.c8@mail.com'),
    ('Ignacio', 'Ibañez', '28999000', 'Chacabuco 900, Neuquén', '29940001009', 'ignacio.ibanez.c9@mail.com'),
    ('Julieta', 'Juárez', '29000111', 'Gral. Paz 1000, Santa Fe', '34240001010', 'julieta.juarez.c10@mail.com'),
    ('Kevin', 'Kaufman', '30111222', 'Entre Ríos 1100, Paraná', '34340001011', 'kevin.kaufman.c11@mail.com'),
    ('Luciana', 'Ledesma', '31222333', 'San Luis 1200, Resistencia', '36240001012', 'luciana.ledesma.c12@mail.com'),
    ('Martín', 'Méndez', '32333444', 'Av. Roca 1300, Sgo. Estero', '38540001013', 'martin.mendez.c13@mail.com'),
    ('Nerea', 'Navarro', '33444555', '9 de Julio 1400, Río Gallegos', '2966400014', 'nerea.navarro.c14@mail.com'),
    ('Omar', 'Ortiz', '34555666', 'Perú 1500, Viedma', '2920400015', 'omar.ortiz.c15@mail.com'),
    ('Paula', 'Pérez', '35666777', 'Urquiza 1600, San Juan', '26440001016', 'paula.perez.c16@mail.com'),
    ('Quintín', 'Quinteros', '36777888', 'Chacabuco 1700, San Luis', '26640001017', 'quintin.quinteros.c17@mail.com'),
    ('Rocío', 'Ramírez', '37888999', 'Brown 1800, Ushuaia', '2901400018', 'rocio.ramirez.c18@mail.com'),
    ('Santiago', 'Sosa', '38999000', 'Mitre 1900, Rawson', '2804400019', 'santiago.sosa.c19@mail.com'),
    ('Tamara', 'Torres', '39000111', 'Av. Alem 2000, La Rioja', '3804400020', 'tamara.torres.c20@mail.com'),
    ('Ulises', 'Ugarte', '40111222', 'Rivadavia 2100, Jujuy', '3884400021', 'ulises.ugarte.c21@mail.com'),
    ('Victoria', 'Vera', '41222333', 'Sarmiento 2200, Catamarca', '3835400022', 'victoria.vera.c22@mail.com'),
    ('Walter', 'Winkler', '42333444', '25 de Mayo 2300, Formosa', '3704400023', 'walter.winkler.c23@mail.com'),
    ('Ximena', 'Xavier', '43444555', 'Av. Laprida 2400, Corrientes', '3794400024', 'ximena.xavier.c24@mail.com'),
    ('Yago', 'Yañez', '44555666', 'San Juan 2500, Goya', '3777400025', 'yago.yanez.c25@mail.com'),
    ('Zoe', 'Zarate', '45666777', 'Misiones 2600, Oberá', '3755400026', 'zoe.zarate.c26@mail.com'),
    ('Aaron', 'Acevedo', '46777888', 'Av. Roca 2700, Tandil', '2293400027', 'aaron.acevedo.c27@mail.com'),
    ('Brenda', 'Barrios', '47888999', 'Av. Libertador 2800, CABA', '1140001028', 'brenda.barrios.c28@mail.com'),
    ('Camilo', 'Cáceres', '48999000', 'Junín 2900, Neuquén', '29940001029', 'camilo.caceres.c29@mail.com'),
    ('Delfina', 'Domínguez', '49000111', 'Las Heras 3000, Mendoza', '26140001030', 'delfina.dominguez.c30@mail.com'),
    ('Esteban', 'Estrada', '50111222', 'Roca 3100, Río Cuarto', '35840001031', 'esteban.estrada.c31@mail.com'),
    ('Fátima', 'Figueroa', '51222333', 'Av. Corrientes 3200, CABA', '1140001032', 'fatima.figueroa.c32@mail.com'),
    ('Gerardo', 'Godoy', '52333444', 'San Juan 3300, Formosa', '3704400033', 'gerardo.godoy.c33@mail.com'),
    ('Hilda', 'Heredia', '53444555', 'Pueyrredón 3400, Salta', '38740001034', 'hilda.heredia.c34@mail.com'),
    ('Iván', 'Irigoyen', '54555666', 'Entre Ríos 3500, Paraná', '34340001035', 'ivan.irigoyen.c35@mail.com'),
    ('Jazmín', 'Jiménez', '55666777', 'Av. Mitre 3600, San Juan', '26440001036', 'jazmin.jimenez.c36@mail.com'),
    ('Luciano', 'Luna', '56777888', 'Alsina 3700, Bahía Blanca', '29140001037', 'luciano.luna.c37@mail.com'),
    ('Micaela', 'Moreno', '57888999', '9 de Julio 3800, Resistencia', '36240001038', 'micaela.moreno.c38@mail.com'),
    ('Noel', 'Núñez', '58999000', 'San Martín 3900, Viedma', '2920400039', 'noel.nunez.c39@mail.com'),
    ('Octavio', 'Olivera', '59000111', 'Av. Belgrano 4000, Tucumán', '38140001040', 'octavio.olivera.c40@mail.com'),
    ('Patricia', 'Paz', '60111222', 'Laprida 4100, Posadas', '37640001041', 'patricia.paz.c41@mail.com'),
    ('Ramiro', 'Ríos', '61222333', 'Roca 4200, Sgo. Estero', '38540001042', 'ramiro.rios.c42@mail.com'),
    ('Silvina', 'Sánchez', '62333444', 'Av. San Martín 4300, Rawson', '2804400043', 'silvina.sanchez.c43@mail.com'),
    ('Tomás', 'Tapia', '63444555', 'Rivadavia 4400, Catamarca', '3835400044', 'tomas.tapia.c44@mail.com'),
    ('Úrsula', 'Uriarte', '64555666', 'Entre Ríos 4500, Corrientes', '3794400045', 'ursula.uriarte.c45@mail.com'),
    ('Víctor', 'Vázquez', '65666777', 'Gral. Paz 4600, Santa Fe', '34240001046', 'victor.vazquez.c46@mail.com'),
    ('Yamila', 'Yunes', '66777888', 'Av. 9 de Julio 4700, CABA', '1140001047', 'yamila.yunes.c47@mail.com'),
    ('Adrián', 'Acosta', '67888999', 'Av. Belgrano 4800, Córdoba', '35140001048', 'adrian.acosta.c48@mail.com'),
    ('Bruno', 'Benítez', '68999000', 'Independencia 4900, Jujuy', '3884400049', 'bruno.benitez.c49@mail.com'),
    ('Carina', 'Cano', '69000111', 'Av. San Martín 5000, Ushuaia', '2901400050', 'carina.cano.c50@mail.com'),
    ('Damián', 'Delgado', '70111222', 'Alberdi 5100, Neuquén', '29940001051', 'damian.delgado.c51@mail.com'),
    ('Evelyn', 'Escobar', '71222333', 'Sarmiento 5200, Salta', '38740001052', 'evelyn.escobar.c52@mail.com'),
    ('Felipe', 'Flores', '72333444', 'Mitre 5300, San Luis', '26640001053', 'felipe.flores.c53@mail.com'),
    ('Gisela', 'Gallo', '73444555', 'Av. Córdoba 5400, CABA', '1140001054', 'gisela.gallo.c54@mail.com'),
    ('Héctor', 'Ibáñez', '74555666', 'Gral. Paz 5500, Mendoza', '26140001055', 'hector.ibanez.c55@mail.com'),
    ('Iris', 'López', '75666777', 'San Juan 5600, Rosario', '34140001056', 'iris.lopez.c56@mail.com'),
    ('Julio', 'Molina', '76777888', 'Roca 5700, La Plata', '22140001057', 'julio.molina.c57@mail.com'),
    ('Karen', 'Nieto', '77888999', 'Av. 9 de Julio 5800, CABA', '1140001058', 'karen.nieto.c58@mail.com'),
    ('Lucas', 'Pérez', '78999000', 'San Martín 5900, Corrientes', '3794400059', 'lucas.perez.c59@mail.com'),
    ('Marta', 'Rojas', '79000111', 'Av. Mitre 6000, Córdoba', '35140001060', 'marta.rojas.c60@mail.com');
-- Empleado
INSERT INTO
    Empleado (idSucursal, idTipoEmpleado, nombre, apellido, dni, email)
VALUES -- SUCURSAL 1 (CABA - 12 Empleados)
    (1, 4, 'Hilda', 'Gutiérrez', '50000001', 'hilda.gutierrez.s1@empresa.com'),
    -- Gerente
    (1, 2, 'Claudio', 'Arias', '50000002', 'claudio.arias.s1@empresa.com'),
    -- Analista
    (1, 2, 'Estela', 'Bustos', '50000003', 'estela.bustos.s1@empresa.com'),
    -- Analista
    (1, 3, 'Ruben', 'Carrizo', '50000004', 'ruben.carrizo.s1@empresa.com'),
    -- Cobranza
    (1, 3, 'Sara', 'Delgado', '50000005', 'sara.delgado.s1@empresa.com'),
    -- Cobranza
    (1, 1, 'Teresa', 'Fuentes', '50000006', 'teresa.fuentes.s1@empresa.com'),
    -- Atención
    (1, 1, 'Omar', 'Gálvez', '50000007', 'omar.galvez.s1@empresa.com'),
    -- Atención
    (1, 1, 'Marta', 'Juárez', '50000008', 'marta.juarez.s1@empresa.com'),
    -- Atención
    (1, 1, 'Lucas', 'Leiva', '50000009', 'lucas.leiva.s1@empresa.com'),
    -- Atención
    (1, 1, 'Iris', 'Molina', '50000010', 'iris.molina.s1@empresa.com'),
    -- Atención
    (1, 5, 'Gustavo', 'Nieto', '50000011', 'gustavo.nieto.s1@empresa.com'),
    -- Administrativo
    (1, 5, 'Pamela', 'Ochoa', '50000012', 'pamela.ochoa.s1@empresa.com'),
    -- Administrativo
    -- SUCURSAL 2 (Córdoba - 12 Empleados)
    (2, 4, 'Daniel', 'Paz', '50000013', 'daniel.paz.s2@empresa.com'),
    -- Gerente
    (2, 2, 'Elena', 'Quiroga', '50000014', 'elena.quiroga.s2@empresa.com'),
    -- Analista
    (2, 2, 'Fernando', 'Ríos', '50000015', 'fernando.rios.s2@empresa.com'),
    -- Analista
    (2, 3, 'Andrea', 'Sosa', '50000016', 'andrea.sosa.s2@empresa.com'),
    -- Cobranza
    (2, 3, 'Victor', 'Tapia', '50000017', 'victor.tapia.s2@empresa.com'),
    -- Cobranza
    (2, 1, 'Silvia', 'Ugarte', '50000018', 'silvia.ugarte.s2@empresa.com'),
    -- Atención
    (2, 1, 'Juan', 'Vidal', '50000019', 'juan.vidal.s2@empresa.com'),
    -- Atención
    (2, 1, 'Noelia', 'Yáñez', '50000020', 'noelia.yanez.s2@empresa.com'),
    -- Atención
    (2, 1, 'Raúl', 'Zárate', '50000021', 'raul.zarate.s2@empresa.com'),
    -- Atención
    (2, 1, 'Karina', 'Alonso', '50000022', 'karina.alonso.s2@empresa.com'),
    -- Atención
    (2, 5, 'Marcos', 'Blanco', '50000023', 'marcos.blanco.s2@empresa.com'),
    -- Administrativo
    (2, 3, 'Gabriela', 'Cáceres', '50000024', 'gabriela.caceres.s2@empresa.com'),
    -- Cobranza
    -- SUCURSAL 3 (Mendoza - 12 Empleados)
    (3, 4, 'Lucia', 'Durán', '50000025', 'lucia.duran.s3@empresa.com'),
    -- Gerente
    (3, 2, 'Maxi', 'Escobar', '50000026', 'maxi.escobar.s3@empresa.com'),
    -- Analista
    (3, 2, 'Natalia', 'Fuentes', '50000027', 'natalia.fuentes.s3@empresa.com'),
    -- Analista
    (3, 3, 'Oscar', 'Giménez', '50000028', 'oscar.gimenez.s3@empresa.com'),
    -- Cobranza
    (3, 3, 'Flavia', 'Herrera', '50000029', 'flavia.herrera.s3@empresa.com'),
    -- Cobranza
    (3, 1, 'Renzo', 'Ibañez', '50000030', 'renzo.ibanez.s3@empresa.com'),
    -- Atención
    (3, 1, 'Soledad', 'Jara', '50000031', 'soledad.jara.s3@empresa.com'),
    -- Atención
    (3, 1, 'Pedro', 'Kunz', '50000032', 'pedro.kunz.s3@empresa.com'),
    -- Atención
    (3, 1, 'Vanesa', 'López', '50000033', 'vanesa.lopez.s3@empresa.com'),
    -- Atención
    (3, 1, 'Tomás', 'Méndez', '50000034', 'tomas.mendez.s3@empresa.com'),
    -- Atención
    (3, 5, 'Úrsula', 'Núñez', '50000035', 'ursula.nunez.s3@empresa.com'),
    -- Administrativo
    (3, 2, 'Walter', 'Ortiz', '50000036', 'walter.ortiz.s3@empresa.com'),
    -- Analista
    -- SUCURSAL 4 (Rosario - 12 Empleados)
    (4, 4, 'Ximena', 'Paredes', '50000037', 'ximena.paredes.s4@empresa.com'),
    -- Gerente
    (4, 2, 'Yamila', 'Quinteros', '50000038', 'yamila.quinteros.s4@empresa.com'),
    -- Analista
    (4, 2, 'Zacarias', 'Rodríguez', '50000039', 'zacarias.rodriguez.s4@empresa.com'),
    -- Analista
    (4, 3, 'Adriana', 'Sánchez', '50000040', 'adriana.sanchez.s4@empresa.com'),
    -- Cobranza
    (4, 3, 'Bruno', 'Torres', '50000041', 'bruno.torres.s4@empresa.com'),
    -- Cobranza
    (4, 1, 'Camila', 'Vera', '50000042', 'camila.vera.s4@empresa.com'),
    -- Atención
    (4, 1, 'Diego', 'Winkler', '50000043', 'diego.winkler.s4@empresa.com'),
    -- Atención
    (4, 1, 'Erica', 'Yunes', '50000044', 'erica.yunes.s4@empresa.com'),
    -- Atención
    (4, 1, 'Fabián', 'Zelaya', '50000045', 'fabian.zelaya.s4@empresa.com'),
    -- Atención
    (4, 1, 'Giselle', 'Acosta', '50000046', 'giselle.acosta.s4@empresa.com'),
    -- Atención
    (4, 3, 'Hernan', 'Benítez', '50000047', 'hernan.benitez.s4@empresa.com'),
    -- Cobranza
    (4, 2, 'Inés', 'Castro', '50000048', 'ines.castro.s4@empresa.com'),
    -- Analista
    -- SUCURSAL 5 (CABA Microcentro - 12 Empleados)
    (5, 4, 'Javier', 'Díaz', '50000049', 'javier.diaz.s5@empresa.com'),
    -- Gerente
    (5, 2, 'Laura', 'Espósito', '50000050', 'laura.esposito.s5@empresa.com'),
    -- Analista
    (5, 2, 'Martín', 'Flores', '50000051', 'martin.flores.s5@empresa.com'),
    -- Analista
    (5, 3, 'Nora', 'Gómez', '50000052', 'nora.gomez.s5@empresa.com'),
    -- Cobranza
    (5, 3, 'Pablo', 'Heredia', '50000053', 'pablo.heredia.s5@empresa.com'),
    -- Cobranza
    (5, 1, 'Quimey', 'Ibarra', '50000054', 'quimey.ibarra.s5@empresa.com'),
    -- Atención
    (5, 1, 'Román', 'Jerez', '50000055', 'roman.jerez.s5@empresa.com'),
    -- Atención
    (5, 1, 'Sonia', 'Koval', '50000056', 'sonia.koval.s5@empresa.com'),
    -- Atención
    (5, 1, 'Mario', 'Lescano', '50000057', 'mario.lescano.s5@empresa.com'),
    -- Atención
    (5, 1, 'Ezequiel', 'Méndez', '50000058', 'ezequiel.mendez.s5@empresa.com'),
    -- Atención
    (5, 5, 'Belén', 'Navarro', '50000059', 'belen.navarro.s5@empresa.com'),
    -- Administrativo
    (5, 3, 'Cecilia', 'Ortiz', '50000060', 'cecilia.ortiz.s5@empresa.com');
-- Cobranza
-- HistoricoTasa
INSERT INTO
    HistoricoTasa (idProducto, tasa, fechaInicio, fechaFin)
VALUES
    (1, 65.19, '2025-01-08', NULL),
    (2, 35.15, '2025-01-22', NULL),
    (3, 63.08, '2025-01-07', NULL),
    (4, 51.27, '2025-01-15', NULL),
    (5, 39.79, '2025-01-08', NULL),
    (6, 59.02, '2025-01-22', NULL),
    (7, 41.34, '2025-01-29', NULL),
    (8, 40.56, '2025-01-02', NULL),
    (9, 59.14, '2025-01-10', NULL),
    (10, 64.96, '2025-01-22', NULL),
    (11, 37.79, '2025-01-25', NULL),
    (12, 44.78, '2025-01-29', NULL),
    (13, 10.25, '2025-01-14', NULL),
    (14, 10.94, '2025-01-12', NULL),
    (15, 14.58, '2025-01-07', NULL),
    (16, 16.68, '2025-01-16', NULL),
    (17, 12.76, '2025-01-14', NULL),
    (18, 14.89, '2025-01-21', NULL),
    (19, 22.69, '2025-01-29', NULL),
    (20, 15.02, '2025-01-11', NULL),
    (21, 23.47, '2025-01-26', NULL),
    (22, 10.03, '2025-01-18', NULL),
    (23, 24.31, '2025-01-29', NULL),
    (24, 21.17, '2025-01-12', NULL),
    (25, 40.95, '2025-01-13', NULL),
    (26, 29.93, '2025-01-05', NULL),
    (27, 37.69, '2025-01-09', NULL),
    (28, 37.33, '2025-01-25', NULL),
    (29, 39.97, '2025-01-13', NULL),
    (30, 20.93, '2025-01-31', NULL),
    (31, 35.15, '2025-01-07', NULL),
    (32, 27.22, '2025-01-07', NULL),
    (33, 25.29, '2025-01-01', NULL),
    (34, 44.87, '2025-01-09', NULL),
    (35, 20.69, '2025-01-28', NULL),
    (36, 23.34, '2025-01-06', NULL),
    (37, 27.05, '2025-01-19', NULL),
    (38, 21.00, '2025-01-21', NULL),
    (39, 36.24, '2025-01-07', NULL),
    (40, 29.50, '2025-01-17', NULL),
    (41, 24.16, '2025-01-23', NULL),
    (42, 20.37, '2025-01-01', NULL),
    (43, 35.91, '2025-01-05', NULL),
    (44, 32.70, '2025-01-01', NULL),
    (45, 32.83, '2025-01-05', NULL),
    (46, 23.01, '2025-01-24', NULL),
    (47, 38.74, '2025-01-31', NULL),
    (48, 32.83, '2025-01-07', NULL),
    (49, 71.57, '2025-01-25', NULL),
    (50, 73.09, '2025-01-24', NULL),
    (51, 72.78, '2025-01-13', NULL),
    (52, 49.90, '2025-01-12', NULL),
    (53, 72.54, '2025-01-13', NULL),
    (54, 72.72, '2025-01-14', NULL),
    (55, 74.98, '2025-01-11', NULL),
    (56, 73.71, '2025-01-11', NULL),
    (57, 68.81, '2025-01-31', NULL),
    (58, 61.65, '2025-01-30', NULL),
    (59, 77.83, '2025-01-20', NULL),
    (60, 68.22, '2025-01-11', NULL);
-- SolicitudCredito
INSERT INTO
    SolicitudCredito (idCliente, idEmpleado, idProducto, idEstadoSolicitud, idEvaluacionRelevante, montoSolicitado, destino, fechaSolicitud)
VALUES -- Productos Personales (1-12) y Hipotecarios (13-24)
    (1, 6, 1, 2, 1, 120000.00, 'Compra de moto', '2025-01-10 09:30:00'),
    -- Aprobada
    (2, 18, 14, 3, 2, 15000000.00, 'Compra de casa nueva', '2025-01-11 10:00:00'),
    -- Rechazada (por evaluación de riesgo 2)
    (3, 30, 3, 2, 3, 500000.00, 'Viaje familiar', '2025-01-12 11:15:00'),
    -- Aprobada
    (4, 42, 16, 2, 4, 8000000.00, 'Refacción de departamento', '2025-01-13 12:30:00'),
    -- Aprobada
    (5, 54, 5, 3, 5, 300000.00, 'Adquisición de equipamiento deportivo', '2025-01-14 14:00:00'),
    -- Rechazada
    (6, 7, 18, 2, 6, 10000000.00, 'Vivienda única', '2025-01-15 15:30:00'),
    -- Aprobada
    (7, 19, 7, 1, 7, 180000.00, 'Estudios de posgrado', '2025-01-16 09:00:00'),
    -- Pendiente
    (8, 31, 20, 2, 8, 12000000.00, 'Vivienda de veraneo', '2025-01-17 10:45:00'),
    -- Aprobada
    (9, 43, 9, 3, 9, 400000.00, 'Consolidación de deudas', '2025-01-18 13:00:00'),
    -- Rechazada
    (10, 55, 22, 2, 10, 20000000.00, 'Adquisición de terreno', '2025-01-19 14:30:00'),
    -- Aprobada
    (11, 8, 11, 2, 11, 700000.00, 'Compra de automóvil usado', '2025-01-20 09:45:00'),
    -- Aprobada
    (12, 20, 24, 2, 12, 11500000.00, 'Hipotecario con destino comercial', '2025-01-21 11:30:00'),
    -- Aprobada
    (13, 32, 2, 3, 13, 250000.00, 'Reemplazo de electrodomésticos', '2025-01-22 13:45:00'),
    -- Rechazada
    (14, 44, 13, 2, 14, 18000000.00, 'Compra de propiedad en el exterior', '2025-01-23 15:00:00'),
    -- Aprobada
    (15, 56, 4, 2, 15, 65000.00, 'Gastos médicos', '2025-01-24 16:30:00'),
    -- Aprobada
    (16, 9, 15, 2, 16, 9000000.00, 'Construcción en lote propio', '2025-01-25 10:15:00'),
    -- Aprobada
    (17, 21, 6, 4, 17, 350000.00, 'Inversión en criptomonedas', '2025-01-26 11:45:00'),
    -- En Revisión
    (18, 33, 17, 3, 18, 10000000.00, 'Hipotecario con garantía de tercero', '2025-01-27 13:00:00'),
    -- Rechazada
    (19, 45, 8, 2, 19, 220000.00, 'Viaje al Caribe', '2025-01-28 14:15:00'),
    -- Aprobada
    (20, 57, 10, 2, 20, 4000000.00, 'Comprar un NFT de alto valor', '2025-01-29 15:45:00'),
    -- Aprobada
    -- Productos Empresariales (25-36) y Leasing (37-48)
    (21, 10, 25, 2, 21, 3500000.00, 'Ampliación de Capital de Trabajo', '2025-02-01 09:00:00'),
    -- Aprobada
    (22, 22, 38, 2, 22, 7000000.00, 'Leasing de maquinaria pesada', '2025-02-02 10:30:00'),
    -- Aprobada
    (23, 34, 27, 3, 23, 5000000.00, 'Inversión en bolsa', '2025-02-03 11:45:00'),
    -- Rechazada
    (24, 46, 40, 2, 24, 5500000.00, 'Leasing de flota de vehículos (5 unidades)', '2025-02-04 13:00:00'),
    -- Aprobada
    (25, 58, 29, 2, 25, 1000000.00, 'Línea de crédito rotatoria', '2025-02-05 14:15:00'),
    -- Aprobada
    (26, 11, 42, 3, 26, 10000000.00, 'Leasing de inmueble para oficina', '2025-02-06 15:45:00'),
    -- Rechazada
    (27, 23, 31, 2, 27, 6500000.00, 'Préstamo Agropecuario (Siembra)', '2025-02-07 09:30:00'),
    -- Aprobada
    (28, 35, 44, 2, 28, 4000000.00, 'Leasing de equipamiento informático', '2025-02-08 11:00:00'),
    -- Aprobada
    (29, 47, 33, 3, 29, 2000000.00, 'Crédito MiPyME para exportación', '2025-02-09 12:45:00'),
    -- Rechazada
    (30, 59, 46, 2, 30, 3000000.00, 'Leasing de transporte de pasajeros', '2025-02-10 14:00:00'),
    -- Aprobada
    (31, 12, 35, 2, 31, 4000000.00, 'Préstamo Tecnológico', '2025-02-11 15:15:00'),
    -- Aprobada
    (32, 24, 48, 2, 32, 7000000.00, 'Leasing de maquinaria de construcción', '2025-02-12 16:45:00'),
    -- Aprobada
    (33, 36, 30, 3, 33, 10000000.00, 'Crédito comercial en USD', '2025-02-13 09:00:00'),
    -- Rechazada
    (34, 48, 37, 2, 34, 2000000.00, 'Leasing de vehículos utilitarios', '2025-02-14 10:30:00'),
    -- Aprobada
    (35, 60, 39, 4, 35, 8000000.00, 'Crédito para Franquicia', '2025-02-15 12:00:00'),
    -- En Revisión
    (36, 1, 41, 2, 36, 5000000.00, 'Leasing de maquinaria agrícola', '2025-02-16 13:30:00'),
    -- Aprobada
    (37, 13, 26, 2, 37, 8000000.00, 'Crédito PyME para Inversión', '2025-02-17 14:45:00'),
    -- Aprobada
    (38, 25, 43, 2, 38, 3000000.00, 'Leasing de equipamiento médico', '2025-02-18 16:00:00'),
    -- Aprobada
    (39, 37, 28, 3, 39, 1500000.00, 'Préstamo Empresarial Nuevo', '2025-02-19 09:15:00'),
    -- Rechazada
    (40, 49, 45, 2, 40, 4500000.00, 'Leasing de tecnología de punta', '2025-02-20 10:45:00'),
    -- Aprobada
    -- Tarjetas Corporativas (49-60) 
    (41, 50, 49, 2, 41, 1500000.00, 'Gastos de Representación (Tarjeta)', '2025-03-01 12:30:00'),
    -- Aprobada
    (42, 2, 51, 3, 42, 2000000.00, 'Ampliación límite tarjeta corporativa', '2025-03-02 14:00:00'),
    -- Rechazada
    (43, 14, 53, 2, 43, 3500000.00, 'Adquisición de flota (Tarjeta)', '2025-03-03 15:30:00'),
    -- Aprobada
    (44, 26, 55, 2, 44, 400000.00, 'Gastos de viaje y hotelería', '2025-03-04 09:45:00'),
    -- Aprobada
    (45, 38, 57, 2, 45, 600000.00, 'Tarjeta para profesionales independientes', '2025-03-05 11:15:00'),
    -- Aprobada
    (46, 51, 59, 3, 46, 1000000.00, 'Tarjeta Premium Viajes', '2025-03-06 12:45:00'),
    -- Rechazada
    (47, 3, 60, 2, 47, 850000.00, 'Tarjeta Corporativa Servicios', '2025-03-07 14:00:00'),
    -- Aprobada
    (48, 15, 50, 2, 48, 1000000.00, 'Compra de insumos (Tarjeta PyME)', '2025-03-08 15:30:00'),
    -- Aprobada
    (49, 27, 52, 2, 49, 4500000.00, 'Límite Tarjeta Black', '2025-03-09 10:00:00'),
    -- Aprobada
    (50, 39, 54, 3, 50, 500000.00, 'Financiación de gastos menores', '2025-03-10 11:30:00'),
    -- Rechazada
    (51, 52, 56, 2, 51, 300000.00, 'Tarjeta para gastos iniciales de Startup', '2025-03-11 13:00:00'),
    -- Aprobada
    (52, 4, 58, 4, 52, 700000.00, 'Tarjeta Monotributista (Ampliación)', '2025-03-12 14:30:00'),
    -- En Revisión
    (53, 16, 12, 2, 53, 400000.00, 'Préstamo de Libre Disponibilidad', '2025-03-13 16:00:00'),
    -- Aprobada
    (54, 28, 23, 2, 54, 15000000.00, 'Hipotecario Tasa Variable', '2025-03-14 10:15:00'),
    -- Aprobada
    (55, 40, 34, 3, 55, 3000000.00, 'Préstamo Comercial en USD', '2025-03-15 11:45:00'),
    -- Rechazada
    (56, 53, 47, 2, 56, 2500000.00, 'Leasing de Software', '2025-03-16 13:00:00'),
    -- Aprobada
    (57, 5, 59, 2, 57, 1800000.00, 'Tarjeta Corporate Oro', '2025-03-17 14:15:00'),
    -- Aprobada
    (58, 17, 36, 2, 58, 5500000.00, 'Préstamo Sustentable', '2025-03-18 15:30:00'),
    -- Aprobada
    (59, 29, 49, 3, 59, 4000000.00, 'Leasing de Construcción', '2025-03-19 09:30:00'),
    -- Rechazada
    (60, 41, 10, 2, 60, 550000.00, 'Préstamo Rápido Online', '2025-03-20 11:00:00');
-- Aprobada
-- Credito
INSERT INTO
    Credito (idSolicitud, idProducto, montoOtorgado, tasaInteres, plazoMeses, fechaInicio, fechaFin, idCreditoRefinanciado)
VALUES -- Grupo 1 (Solicitudes Aprobadas: ID 1, 3, 4, 6, 8, 10, 11, 12, 14, 15)
    (1, 1, 120000.00, 65.19, 12, '2025-01-20', '2026-01-20', NULL),
    (3, 3, 500000.00, 63.08, 36, '2025-01-22', '2028-01-22', NULL),
    (4, 16, 8000000.00, 16.68, 120, '2025-01-23', '2035-01-23', NULL),
    (6, 18, 9500000.00, 14.89, 240, '2025-01-25', '2045-01-25', NULL),
    -- Se otorga menos que lo solicitado
    (8, 20, 12000000.00, 15.02, 180, '2025-01-27', '2040-01-27', NULL),
    (10, 22, 20000000.00, 10.03, 300, '2025-01-29', '2050-01-29', NULL),
    (11, 11, 700000.00, 37.79, 48, '2025-01-30', '2029-01-30', NULL),
    (12, 24, 11500000.00, 21.17, 60, '2025-01-31', '2030-01-31', NULL),
    (14, 13, 17500000.00, 10.25, 240, '2025-02-02', '2045-02-02', NULL),
    -- Se otorga menos
    (15, 4, 65000.00, 51.27, 6, '2025-02-03', '2025-08-03', NULL),
    -- Grupo 2 (Solicitudes Aprobadas: ID 16, 19, 20, 21, 22, 24, 25, 27, 28, 30)
    (16, 15, 9000000.00, 14.58, 240, '2025-02-04', '2045-02-04', NULL),
    (19, 8, 220000.00, 40.56, 18, '2025-02-07', '2026-08-07', NULL),
    (20, 10, 4000000.00, 64.96, 48, '2025-02-08', '2029-02-08', NULL),
    (21, 25, 3500000.00, 40.95, 36, '2025-02-11', '2028-02-11', NULL),
    (22, 38, 7000000.00, 21.00, 60, '2025-02-12', '2030-02-12', NULL),
    (24, 40, 5500000.00, 29.50, 48, '2025-02-14', '2029-02-14', NULL),
    (25, 29, 1000000.00, 39.97, 12, '2025-02-15', '2026-02-15', NULL),
    (27, 31, 6500000.00, 35.15, 60, '2025-02-17', '2030-02-17', NULL),
    (28, 44, 4000000.00, 32.70, 36, '2025-02-18', '2028-02-18', NULL),
    (30, 46, 3000000.00, 23.01, 72, '2025-02-20', '2031-02-20', NULL),
    -- Grupo 3 (Solicitudes Aprobadas: ID 31, 32, 34, 36, 37, 38, 40, 41, 43, 44)
    (31, 35, 4000000.00, 20.69, 36, '2025-02-21', '2028-02-21', NULL),
    (32, 48, 7000000.00, 32.83, 48, '2025-02-22', '2029-02-22', NULL),
    (34, 37, 2000000.00, 27.05, 24, '2025-02-24', '2027-02-24', NULL),
    (36, 41, 5000000.00, 24.16, 60, '2025-02-26', '2030-02-26', NULL),
    (37, 26, 8000000.00, 29.93, 36, '2025-02-27', '2028-02-27', NULL),
    (38, 43, 3000000.00, 35.91, 48, '2025-02-28', '2029-02-28', NULL),
    (40, 45, 4500000.00, 32.83, 60, '2025-03-02', '2030-03-02', NULL),
    (41, 49, 1500000.00, 71.57, 12, '2025-03-10', '2026-03-10', NULL),
    (43, 53, 3500000.00, 72.54, 18, '2025-03-13', '2026-09-13', NULL),
    (44, 55, 400000.00, 74.98, 6, '2025-03-14', '2025-09-14', NULL),
    -- Grupo 4 (Solicitudes Aprobadas: ID 45, 47, 48, 49, 51, 53, 54, 56, 57, 58, 60)
    (45, 57, 600000.00, 68.81, 12, '2025-03-15', '2026-03-15', NULL),
    (47, 60, 850000.00, 68.22, 24, '2025-03-17', '2027-03-17', NULL),
    (48, 50, 1000000.00, 73.09, 18, '2025-03-18', '2026-09-18', NULL),
    (49, 52, 4500000.00, 49.90, 36, '2025-03-19', '2028-03-19', NULL),
    (51, 56, 300000.00, 73.71, 6, '2025-03-21', '2025-09-21', NULL),
    (53, 12, 400000.00, 44.78, 12, '2025-03-23', '2026-03-23', NULL),
    (54, 23, 15000000.00, 24.31, 300, '2025-03-24', '2050-03-24', NULL),
    (56, 47, 2500000.00, 38.74, 36, '2025-03-26', '2028-03-26', NULL),
    (57, 59, 1800000.00, 77.83, 24, '2025-03-27', '2027-03-27', NULL),
    (58, 36, 5500000.00, 23.34, 48, '2025-03-28', '2029-03-28', NULL),
    (60, 10, 550000.00, 64.96, 18, '2025-03-30', '2026-09-30', NULL);
-- Cuota
INSERT INTO
    Cuota (idCredito, numeroCuota, fechaVencimiento, montoTotal, idEstadoCuota)
VALUES -- CRÉDITO 1: (idCredito: 1, Monto: 120000.00, Tasa: 65.19, Plazo: 12M, Inicio: 2025-01-20)
    (1, 1, '2025-02-20', 13735.20, 2),
    -- Pagada
    (1, 2, '2025-03-20', 13735.20, 2),
    -- Pagada
    (1, 3, '2025-04-20', 13735.20, 3),
    -- Vencida (pago en mora)
    (1, 4, '2025-05-20', 13735.20, 1),
    (1, 5, '2025-06-20', 13735.20, 1),
    (1, 6, '2025-07-20', 13735.20, 1),
    (1, 7, '2025-08-20', 13735.20, 1),
    (1, 8, '2025-09-20', 13735.20, 1),
    (1, 9, '2025-10-20', 13735.20, 1),
    (1, 10, '2025-11-20', 13735.20, 1),
    (1, 11, '2025-12-20', 13735.20, 1),
    (1, 12, '2026-01-20', 13735.20, 1),
    -- CRÉDITO 2: (idCredito: 2, Monto: 500000.00, Tasa: 63.08, Plazo: 36M, Inicio: 2025-01-22)
    (2, 1, '2025-02-22', 20389.04, 2),
    -- Pagada
    (2, 2, '2025-03-22', 20389.04, 3),
    -- Vencida
    (2, 3, '2025-04-22', 20389.04, 3),
    -- Vencida
    (2, 4, '2025-05-22', 20389.04, 1),
    (2, 5, '2025-06-22', 20389.04, 1),
    (2, 6, '2025-07-22', 20389.04, 1),
    (2, 7, '2025-08-22', 20389.04, 1),
    (2, 8, '2025-09-22', 20389.04, 1),
    (2, 9, '2025-10-22', 20389.04, 1),
    (2, 10, '2025-11-22', 20389.04, 1),
    (2, 11, '2025-12-22', 20389.04, 1),
    (2, 12, '2026-01-22', 20389.04, 1),
    -- CRÉDITO 3: (idCredito: 3, Monto: 8000000.00, Tasa: 16.68, Plazo: 120M, Inicio: 2025-01-23)
    (3, 1, '2025-02-23', 88920.00, 2),
    -- Pagada
    (3, 2, '2025-03-23', 88920.00, 2),
    -- Pagada
    (3, 3, '2025-04-23', 88920.00, 1),
    (3, 4, '2025-05-23', 88920.00, 1),
    (3, 5, '2025-06-23', 88920.00, 1),
    (3, 6, '2025-07-23', 88920.00, 1),
    (3, 7, '2025-08-23', 88920.00, 1),
    (3, 8, '2025-09-23', 88920.00, 1),
    (3, 9, '2025-10-23', 88920.00, 1),
    (3, 10, '2025-11-23', 88920.00, 1),
    (3, 11, '2025-12-23', 88920.00, 1),
    (3, 12, '2026-01-23', 88920.00, 1),
    -- CRÉDITO 4: (idCredito: 4, Monto: 9500000.00, Tasa: 14.89, Plazo: 240M, Inicio: 2025-01-25)
    (4, 1, '2025-02-25', 56708.96, 2),
    -- Pagada
    (4, 2, '2025-03-25', 56708.96, 2),
    -- Pagada
    (4, 3, '2025-04-25', 56708.96, 1),
    (4, 4, '2025-05-25', 56708.96, 1),
    (4, 5, '2025-06-25', 56708.96, 1),
    (4, 6, '2025-07-25', 56708.96, 1),
    (4, 7, '2025-08-25', 56708.96, 1),
    (4, 8, '2025-09-25', 56708.96, 1),
    (4, 9, '2025-10-25', 56708.96, 1),
    (4, 10, '2025-11-25', 56708.96, 1),
    (4, 11, '2025-12-25', 56708.96, 1),
    (4, 12, '2026-01-25', 56708.96, 1),
    -- CRÉDITO 5: (idCredito: 5, Monto: 12000000.00, Tasa: 15.02, Plazo: 180M, Inicio: 2025-01-27)
    (5, 1, '2025-02-27', 81680.00, 2),
    -- Pagada
    (5, 2, '2025-03-27', 81680.00, 2),
    -- Pagada
    (5, 3, '2025-04-27', 81680.00, 1),
    (5, 4, '2025-05-27', 81680.00, 1),
    (5, 5, '2025-06-27', 81680.00, 1),
    (5, 6, '2025-07-27', 81680.00, 1),
    (5, 7, '2025-08-27', 81680.00, 1),
    (5, 8, '2025-09-27', 81680.00, 1),
    (5, 9, '2025-10-27', 81680.00, 1),
    (5, 10, '2025-11-27', 81680.00, 1),
    (5, 11, '2025-12-27', 81680.00, 1),
    (5, 12, '2026-01-27', 81680.00, 1);
-- Pago
INSERT INTO
    Pago (idCuota, idMetodoPago, fechaPago, montoPagado, diasDemora)
VALUES
    (1, 5, '2025-02-19 00:00:00', 16519.00, 0),
    (2, 3, '2025-03-21 00:00:00', 16519.00, 0),
    (13, 5, '2025-02-20 00:00:00', 40172.22, 0),
    (14, 1, '2025-03-24 00:00:00', 40172.22, 1),
    (49, 1, '2025-02-24 00:00:00', 177866.67, 2),
    (50, 3, '2025-03-24 00:00:00', 177866.67, 0),
    (169, 5, '2025-02-26 00:00:00', 157462.50, 2),
    (170, 2, '2025-03-26 00:00:00', 157462.50, 0),
    (409, 2, '2025-02-26 00:00:00', 216866.67, 0),
    (410, 4, '2025-03-28 00:00:00', 216866.67, 0),
    (589, 5, '2025-02-28 00:00:00', 233833.33, 0),
    (590, 5, '2025-03-31 00:00:00', 233833.33, 1),
    (889, 3, '2025-03-01 00:00:00', 36627.50, 0),
    (890, 2, '2025-03-30 00:00:00', 36627.50, 0),
    (937, 5, '2025-03-04 00:00:00', 394545.83, 2),
    (938, 4, '2025-04-03 00:00:00', 394545.83, 0),
    (997, 5, '2025-03-03 00:00:00', 222395.83, 0),
    (998, 4, '2025-04-03 00:00:00', 222395.83, 0),
    (1237, 2, '2025-03-07 00:00:00', 13610.46, 2),
    (1238, 4, '2025-04-05 00:00:00', 13610.46, 1),
    (1243, 1, '2025-03-05 00:00:00', 146850.00, 0),
    (1244, 2, '2025-04-04 00:00:00', 146850.00, 0),
    (1483, 3, '2025-03-10 00:00:00', 19658.22, 1),
    (1484, 2, '2025-04-08 00:00:00', 19658.22, 0),
    (1501, 1, '2025-03-10 00:00:00', 299866.67, 0),
    (1502, 4, '2025-04-09 00:00:00', 299866.67, 0),
    (1549, 5, '2025-03-15 00:00:00', 216659.72, 2),
    (1550, 4, '2025-04-14 00:00:00', 216659.72, 2),
    (1585, 4, '2025-03-16 00:00:00', 239166.67, 2),
    (1586, 2, '2025-04-13 00:00:00', 239166.67, 0),
    (1645, 2, '2025-03-16 00:00:00', 249791.67, 0),
    (1646, 1, '2025-04-17 00:00:00', 249791.67, 2),
    (1693, 1, '2025-03-17 00:00:00', 116641.67, 0),
    (1694, 4, '2025-04-16 00:00:00', 116641.67, 0),
    (1705, 4, '2025-03-19 00:00:00', 298729.17, 0),
    (1706, 3, '2025-04-18 00:00:00', 298729.17, 0),
    (1765, 2, '2025-03-21 00:00:00', 220111.11, 1),
    (1766, 1, '2025-04-19 00:00:00', 220111.11, 0),
    (1801, 4, '2025-03-24 00:00:00', 99191.67, 2),
    (1802, 1, '2025-04-21 00:00:00', 99191.67, 0),
    (1873, 1, '2025-03-22 00:00:00', 180077.78, 0),
    (1874, 1, '2025-04-21 00:00:00', 180077.78, 0),
    (1909, 2, '2025-03-23 00:00:00', 337341.67, 0),
    (1910, 4, '2025-04-23 00:00:00', 337341.67, 0),
    (1957, 4, '2025-03-26 00:00:00', 128416.67, 0),
    (1958, 1, '2025-04-25 00:00:00', 128416.67, 0),
    (1981, 2, '2025-03-27 00:00:00', 184000.00, 0),
    (1982, 5, '2025-04-29 00:00:00', 184000.00, 2),
    (2041, 2, '2025-03-29 00:00:00', 421755.56, 0),
    (2042, 4, '2025-04-28 00:00:00', 421755.56, 0),
    (2077, 4, '2025-03-30 00:00:00', 152275.00, 0),
    (2078, 1, '2025-04-29 00:00:00', 152275.00, 0),
    (2125, 5, '2025-04-01 00:00:00', 198112.50, 0),
    (2126, 2, '2025-04-30 00:00:00', 198112.50, 0),
    (2185, 4, '2025-04-09 00:00:00', 214462.50, 0),
    (2186, 1, '2025-05-10 00:00:00', 214462.50, 1),
    (2197, 3, '2025-04-12 00:00:00', 406019.44, 0),
    (2198, 4, '2025-05-12 00:00:00', 406019.44, 0),
    (2215, 4, '2025-04-14 00:00:00', 91660.00, 1),
    (2216, 1, '2025-05-14 00:00:00', 91660.00, 1);
-- Penalizacion
INSERT INTO
    Penalizacion (idCuota, montoPenalizacion, motivo, fechaAplicacion)
VALUES
    (3, 825.95, 'Mora por 7 días en cuota mensual', '2025-04-21 10:00:00'),
    (15, 2008.61, 'Incumplimiento de pago en fecha. Gestor de cobranza asignado.', '2025-04-23 11:00:00'),
    (51, 8893.33, 'Mora de 30 días, primera cuota atrasada en hipotecario.', '2025-04-24 10:30:00'),
    (171, 7873.13, 'Penalización por falta de débito automático. Mora 5 días.', '2025-04-26 09:45:00'),
    (411, 10843.33, 'Mora por más de 15 días. Notificación legal enviada.', '2025-04-28 12:15:00'),
    (591, 11691.67, 'Mora por 30 días, primer incumplimiento del cliente.', '2025-04-30 14:00:00'),
    (891, 1831.38, 'Mora en préstamo personal de bajo monto.', '2025-03-31 15:30:00'),
    (939, 19727.29, 'Mora por 3 días. Se revisa estado de la garantía.', '2025-05-04 16:00:00'),
    (999, 11119.79, 'Mora significativa en cuota hipotecaria. Se ofrece refinanciación.', '2025-05-03 09:00:00'),
    (1239, 680.52, 'Mora en cuota final de préstamo de corto plazo.', '2025-04-06 11:30:00'),
    (1245, 7342.50, 'Mora por 10 días. Penalización automática aplicada.', '2025-04-05 13:00:00'),
    (1485, 982.91, 'Mora por 5 días en pago de cuota personal.', '2025-04-12 14:15:00'),
    (1503, 14993.33, 'Mora por 7 días. Primer aviso de cobranza.', '2025-04-10 10:00:00'),
    (1551, 10832.99, 'Penalización alta por mora en crédito PyME. Contactar a garante.', '2025-04-15 11:00:00'),
    (1587, 11958.33, 'Mora en cuota de leasing de vehículo. Revisión de contrato.', '2025-04-15 12:00:00'),
    (1647, 12489.58, 'Mora de 15 días en crédito con puntaje de riesgo alto.', '2025-04-17 13:00:00'),
    (1695, 5832.08, 'Mora en cuota de préstamo PyME. Segundo recordatorio.', '2025-04-17 14:00:00'),
    (1707, 14936.46, 'Mora de 3 días. Penalización aplicada por sistema.', '2025-04-20 15:00:00'),
    (1767, 11005.56, 'Mora por incumplimiento en línea de crédito rotatoria.', '2025-04-22 16:00:00'),
    (1803, 4959.58, 'Mora en crédito con garantía prendaria. Revisión de prenda.', '2025-04-23 09:30:00'),
    (1875, 9003.89, 'Mora por 7 días. Notificación automática al cliente.', '2025-04-24 10:45:00'),
    (1911, 16867.08, 'Mora en cuota de leasing de flota. Penalización alta.', '2025-04-25 12:00:00'),
    (1959, 6420.83, 'Mora en crédito empresarial. Revisión de estado societario.', '2025-04-26 13:15:00'),
    (1983, 9200.00, 'Mora de 2 días. Pago pendiente de transferencia bancaria.', '2025-04-29 14:30:00'),
    (2043, 21087.78, 'Mora por 30 días. Se inicia gestión de cobranza legal.', '2025-04-30 15:45:00'),
    (2079, 7613.75, 'Mora de 5 días. Penalización aplicada.', '2025-04-30 16:30:00'),
    (2127, 9905.63, 'Mora en cuota de Tarjeta Corporativa. Bloqueo de límite.', '2025-05-02 09:00:00'),
    (2187, 10723.13, 'Mora por incumplimiento. Cuota con alto interés de mora.', '2025-05-11 10:15:00'),
    (2199, 20300.97, 'Mora en Tarjeta Corporativa. Bloqueo de la cuenta del cliente.', '2025-05-13 11:30:00'),
    (2217, 4583.00, 'Mora de 1 día. Penalización mínima aplicada.', '2025-05-15 12:45:00'),
    -- PENALIZACIONES ADICIONALES (Mora extendida o penalizaciones de Cuota 2/1)
    (14, 2008.61, 'Mora adicional por extensión de plazo de pago (Cuota 2, Crédito 2).', '2025-04-28 13:00:00'),
    (2, 825.95, 'Mora adicional por 15 días de atraso (Cuota 2, Crédito 1).', '2025-04-05 14:00:00'),
    (50, 8893.33, 'Penalización por mora extendida (Cuota 2, Crédito 3).', '2025-05-01 10:00:00'),
    (170, 7873.13, 'Recargo por gastos de cobranza (Cuota 2, Crédito 4).', '2025-05-02 11:00:00'),
    (410, 10843.33, 'Recargo por segundo mes de atraso (Cuota 2, Crédito 5).', '2025-05-03 12:00:00'),
    (590, 11691.67, 'Mora extendida de 60 días (Cuota 2, Crédito 6).', '2025-05-05 14:00:00'),
    (890, 1831.38, 'Mora por 10 días en cuota personal (Cuota 2, Crédito 7).', '2025-04-09 15:30:00'),
    (938, 19727.29, 'Mora por 15 días, se considera refinanciación (Cuota 2, Crédito 8).', '2025-05-18 16:00:00'),
    (998, 11119.79, 'Recargo por mora extendida (Cuota 2, Crédito 9).', '2025-05-03 09:00:00'),
    (1238, 680.52, 'Mora en cuota final de préstamo (Cuota 2, Crédito 10).', '2025-04-09 11:30:00'),
    (1244, 7342.50, 'Mora por 15 días (Cuota 2, Crédito 11).', '2025-04-20 13:00:00'),
    (1484, 982.91, 'Recargo por gastos administrativos (Cuota 2, Crédito 12).', '2025-04-18 14:15:00'),
    (1502, 14993.33, 'Mora por 15 días, segunda penalización (Cuota 2, Crédito 13).', '2025-04-25 10:00:00'),
    (1550, 10832.99, 'Recargo por mora extendida (Cuota 2, Crédito 14).', '2025-05-14 11:00:00'),
    (1586, 11958.33, 'Mora de 30 días, notificación de embargo (Cuota 2, Crédito 15).', '2025-05-13 12:00:00'),
    (1646, 12489.58, 'Mora extendida (Cuota 2, Crédito 16).', '2025-05-17 13:00:00'),
    (1694, 5832.08, 'Mora por 30 días (Cuota 2, Crédito 17).', '2025-05-17 14:00:00'),
    (1706, 14936.46, 'Mora de 15 días (Cuota 2, Crédito 18).', '2025-05-03 15:00:00'),
    (1766, 11005.56, 'Recargo por mora extendida (Cuota 2, Crédito 19).', '2025-05-22 16:00:00'),
    (1802, 4959.58, 'Mora por 15 días (Cuota 2, Crédito 20).', '2025-05-23 09:30:00'),
    (1874, 9003.89, 'Recargo por mora de 30 días (Cuota 2, Crédito 21).', '2025-05-24 10:45:00'),
    (1910, 16867.08, 'Mora extendida, notificación legal (Cuota 2, Crédito 22).', '2025-05-25 12:00:00'),
    (1958, 6420.83, 'Mora por 15 días (Cuota 2, Crédito 23).', '2025-05-26 13:15:00'),
    (1982, 9200.00, 'Mora de 30 días (Cuota 2, Crédito 24).', '2025-05-29 14:30:00'),
    (2042, 21087.78, 'Mora extendida, bloqueo de cuenta (Cuota 2, Crédito 25).', '2025-05-30 15:45:00'),
    (2078, 7613.75, 'Mora por 15 días (Cuota 2, Crédito 26).', '2025-05-31 16:30:00'),
    (2126, 9905.63, 'Mora de 15 días (Cuota 2, Crédito 27).', '2025-05-15 09:00:00'),
    (2186, 10723.13, 'Mora por 30 días (Cuota 2, Crédito 28).', '2025-06-11 10:15:00'),
    (2198, 20300.97, 'Mora de 15 días (Cuota 2, Crédito 29).', '2025-06-13 11:30:00'),
    (2216, 4583.00, 'Mora de 30 días (Cuota 2, Crédito 30).', '2025-06-14 12:45:00');
-- CampaniaProducto
INSERT INTO
    CampaniaProducto (idCampania, idProducto)
VALUES -- Productos 1-6 asignados a Campaña 1 (Lanzamiento Primavera 2025)
    (1, 1),
    (1, 11),
    (1, 21),
    (1, 31),
    (1, 41),
    (1, 51),
    -- Productos 7-12 asignados a Campaña 2 (Crédito Joven Empresario)
    (2, 2),
    (2, 12),
    (2, 22),
    (2, 32),
    (2, 42),
    (2, 52),
    -- Productos 13-18 asignados a Campaña 3 (Refinancia y Ahorra)
    (3, 3),
    (3, 13),
    (3, 23),
    (3, 33),
    (3, 43),
    (3, 53),
    -- Productos 19-24 asignados a Campaña 4 (Hipotecario Tasa Fija)
    (4, 4),
    (4, 14),
    (4, 24),
    (4, 34),
    (4, 44),
    (4, 54),
    -- Productos 25-30 asignados a Campaña 5 (Black Friday Financiero)
    (5, 5),
    (5, 15),
    (5, 25),
    (5, 35),
    (5, 45),
    (5, 55),
    -- Productos 31-36 asignados a Campaña 6 (Día del Padre PyME)
    (6, 6),
    (6, 16),
    (6, 26),
    (6, 36),
    (6, 46),
    (6, 56),
    -- Productos 37-42 asignados a Campaña 7 (Vuelta al Colegio Crédito)
    (7, 7),
    (7, 17),
    (7, 27),
    (7, 37),
    (7, 47),
    (7, 57),
    -- Productos 43-48 asignados a Campaña 8 (Tarjeta C. Beneficio Cero)
    (8, 8),
    (8, 18),
    (8, 28),
    (8, 38),
    (8, 48),
    (8, 58),
    -- Productos 49-54 asignados a Campaña 9 (Inversión Agro 2025)
    (9, 9),
    (9, 19),
    (9, 29),
    (9, 39),
    (9, 49),
    (9, 59),
    -- Productos 55-60 asignados a Campaña 10 (Préstamo Digital Express)
    (10, 10),
    (10, 20),
    (10, 30),
    (10, 40),
    (10, 50),
    (10, 60);
-- CampaniaCliente
INSERT INTO
    CampaniaCliente (idCampania, idCliente)
VALUES -- Clientes 1-6 asignados a Campaña 1 (Lanzamiento Primavera 2025)
    (1, 1),
    (1, 11),
    (1, 21),
    (1, 31),
    (1, 41),
    (1, 51),
    -- Clientes 7-12 asignados a Campaña 2 (Crédito Joven Empresario)
    (2, 2),
    (2, 12),
    (2, 22),
    (2, 32),
    (2, 42),
    (2, 52),
    -- Clientes 13-18 asignados a Campaña 3 (Refinancia y Ahorra)
    (3, 3),
    (3, 13),
    (3, 23),
    (3, 33),
    (3, 43),
    (3, 53),
    -- Clientes 19-24 asignados a Campaña 4 (Hipotecario Tasa Fija)
    (4, 4),
    (4, 14),
    (4, 24),
    (4, 34),
    (4, 44),
    (4, 54),
    -- Clientes 25-30 asignados a Campaña 5 (Black Friday Financiero)
    (5, 5),
    (5, 15),
    (5, 25),
    (5, 35),
    (5, 45),
    (5, 55),
    -- Clientes 31-36 asignados a Campaña 6 (Día del Padre PyME)
    (6, 6),
    (6, 16),
    (6, 26),
    (6, 36),
    (6, 46),
    (6, 56),
    -- Clientes 37-42 asignados a Campaña 7 (Vuelta al Colegio Crédito)
    (7, 7),
    (7, 17),
    (7, 27),
    (7, 37),
    (7, 47),
    (7, 57),
    -- Clientes 43-48 asignados a Campaña 8 (Tarjeta C. Beneficio Cero)
    (8, 8),
    (8, 18),
    (8, 28),
    (8, 38),
    (8, 48),
    (8, 58),
    -- Clientes 49-54 asignados a Campaña 9 (Inversión Agro 2025)
    (9, 9),
    (9, 19),
    (9, 29),
    (9, 39),
    (9, 49),
    (9, 59),
    -- Clientes 55-60 asignados a Campaña 10 (Préstamo Digital Express)
    (10, 10),
    (10, 20),
    (10, 30),
    (10, 40),
    (10, 50),
    (10, 60);
-- EvaluacionGarante
INSERT INTO
    EvaluacionGarante (idEvaluacion, idGarante)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (31, 31),
    (32, 32),
    (33, 33),
    (34, 34),
    (35, 35),
    (36, 36),
    (37, 37),
    (38, 38),
    (39, 39),
    (40, 40),
    (41, 41),
    (42, 42),
    (43, 43),
    (44, 44),
    (45, 45),
    (46, 46),
    (47, 47),
    (48, 48),
    (49, 49),
    (50, 50),
    (51, 51),
    (52, 52),
    (53, 53),
    (54, 54),
    (55, 55),
    (56, 56),
    (57, 57),
    (58, 58),
    (59, 59),
    (60, 60);
-- EvaluacionCliente
INSERT INTO
    EvaluacionCliente (idEvaluacion, idCliente)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (31, 31),
    (32, 32),
    (33, 33),
    (34, 34),
    (35, 35),
    (36, 36),
    (37, 37),
    (38, 38),
    (39, 39),
    (40, 40),
    (41, 41),
    (42, 42),
    (43, 43),
    (44, 44),
    (45, 45),
    (46, 46),
    (47, 47),
    (48, 48),
    (49, 49),
    (50, 50),
    (51, 51),
    (52, 52),
    (53, 53),
    (54, 54),
    (55, 55),
    (56, 56),
    (57, 57),
    (58, 58),
    (59, 59),
    (60, 60);
-- GaranteSolicitud
INSERT INTO
    GaranteSolicitud (idGarante, idSolicitud)
VALUES -- GRUPO 1: Garante Primario para las 40 Solicitudes Aprobadas (Garante 1-40)
    (1, 1),
    (2, 3),
    (3, 4),
    (4, 6),
    (5, 8),
    (6, 10),
    (7, 11),
    (8, 12),
    (9, 14),
    (10, 15),
    (11, 16),
    (12, 19),
    (13, 20),
    (14, 21),
    (15, 22),
    (16, 24),
    (17, 25),
    (18, 27),
    (19, 28),
    (20, 30),
    (21, 31),
    (22, 32),
    (23, 34),
    (24, 36),
    (25, 37),
    (26, 38),
    (27, 40),
    (28, 41),
    (29, 43),
    (30, 44),
    (31, 45),
    (32, 47),
    (33, 48),
    (34, 49),
    (35, 51),
    (36, 53),
    (37, 54),
    (38, 56),
    (39, 57),
    (40, 58),
    -- GRUPO 2: Garante Secundario para 20 Solicitudes (Garante 41-60 como segundo garante)
    -- Se asignan a las solicitudes más grandes (Hipotecarios y Empresariales).
    (41, 4),
    -- Solicitud 4 (Hipotecario)
    (42, 6),
    -- Solicitud 6 (Hipotecario)
    (43, 8),
    -- Solicitud 8 (Hipotecario)
    (44, 10),
    -- Solicitud 10 (Hipotecario)
    (45, 12),
    -- Solicitud 12 (Hipotecario)
    (46, 14),
    -- Solicitud 14 (Hipotecario)
    (47, 16),
    -- Solicitud 16 (Hipotecario)
    (48, 20),
    -- Solicitud 20 (Hipotecario/Personal alto)
    (49, 21),
    -- Solicitud 21 (Empresarial)
    (50, 22),
    -- Solicitud 22 (Leasing)
    (51, 24),
    -- Solicitud 24 (Leasing)
    (52, 25),
    -- Solicitud 25 (Empresarial)
    (53, 27),
    -- Solicitud 27 (Agropecuario)
    (54, 28),
    -- Solicitud 28 (Leasing)
    (55, 31),
    -- Solicitud 31 (Empresarial)
    (56, 32),
    -- Solicitud 32 (Leasing)
    (57, 34),
    -- Solicitud 34 (Leasing)
    (58, 36),
    -- Solicitud 36 (Leasing)
    (59, 37),
    -- Solicitud 37 (Empresarial)
    (60, 54);
-- Solicitud 54 (Hipotecario)