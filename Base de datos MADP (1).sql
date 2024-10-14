CREATE DATABASE MADP;
USE MADP;

-- #1
CREATE TABLE TipoDeCredito(
    idTipoDeCredito INT PRIMARY KEY,
    TipoDeCredito VARCHAR(50)
);
-- Insert de datos en la tabla TipoDeCredito
INSERT INTO TipoDeCredito (idTipoDeCredito, TipoDeCredito) 
VALUES 
(1, 'Hipotecario'), 
(2, 'Automotriz'), 
(3, 'Personal'), 
(4, 'Educativo'), 
(5, 'Comercial'), 
(6, 'Agrícola'), 
(7, 'Turístico');

-- #2
CREATE TABLE TipoPresupuesto(
    idTipoPresupuesto INT PRIMARY KEY,
    TipoDePresupuesto VARCHAR(50)
);
-- Insert de datos en la tabla TipoPresupuesto
INSERT INTO TipoPresupuesto (idTipoPresupuesto, TipoDePresupuesto) 
VALUES 
(1, 'Anual'), 
(2, 'Mensual'), 
(3, 'Quincenal'), 
(4, 'Semanal'), 
(5, 'Diario'), 
(6, 'Proyecto'), 
(7, 'Emergencia');

-- #3
CREATE TABLE Usuario(
    Cedula INT PRIMARY KEY,
    Nombres VARCHAR(70),
    Apellidos VARCHAR(70),
    Contraseña VARCHAR(60) NOT NULL,
    Correo VARCHAR(120) NOT NULL,
    Profesion VARCHAR(40),
    FechaDeNacimiento DATE,
    Expectativas TEXT
);
-- Insert de datos en la tabla Usuario
INSERT INTO Usuario (Cedula, Nombres, Apellidos, Contraseña, Correo, Profesion, FechaDeNacimiento, Expectativas) 
VALUES 
(1010101, 'Juan', 'Pérez', '123456', 'juan.perez@mail.com', 'Ingeniero', '1980-05-10', 'Superación personal'),
(2020202, 'Ana', 'García', 'abcdef', 'ana.garcia@mail.com', 'Abogada', '1985-07-22', 'Crecimiento profesional'),
(3030303, 'Luis', 'Martínez', 'password', 'luis.martinez@mail.com', 'Doctor', '1978-03-15', 'Estabilidad económica'),
(4040404, 'Marta', 'Rodríguez', 'qwerty', 'marta.rodriguez@mail.com', 'Contadora', '1990-01-05', 'Viajar por el mundo'),
(5050505, 'Pedro', 'Hernández', '123abc', 'pedro.hernandez@mail.com', 'Arquitecto', '1975-11-30', 'Innovación en su campo'),
(6060606, 'Lucía', 'López', 'pass123', 'lucia.lopez@mail.com', 'Diseñadora', '1982-09-09', 'Desarrollo personal'),
(7070707, 'Carlos', 'Sánchez', '654321', 'carlos.sanchez@mail.com', 'Profesor', '1988-12-25', 'Educación continua');

-- #4
CREATE TABLE Presupuesto(
    idPresupuesto INT PRIMARY KEY,
    Fecha DATE,
    idTipoPresupuesto INT NOT NULL,
    Dinero DECIMAL,
    Ahorros DECIMAL,
    Cedula INT NOT NULL,  -- Conexión con la tabla Usuario
    FOREIGN KEY (Cedula) REFERENCES Usuario(Cedula),
    FOREIGN KEY (idTipoPresupuesto) REFERENCES TipoPresupuesto(idTipoPresupuesto)
);
-- Insert de datos en la tabla Presupuesto
INSERT INTO Presupuesto (idPresupuesto, Fecha, idTipoPresupuesto, Dinero, Ahorros, Cedula) 
VALUES 
(1, '2024-01-01', 1, 10000.00, 5000.00, 1010101),
(2, '2024-02-01', 2, 20000.00, 10000.00, 2020202),
(3, '2024-03-01', 3, 15000.00, 7500.00, 3030303),
(4, '2024-04-01', 4, 25000.00, 12500.00, 4040404),
(5, '2024-05-01', 5, 30000.00, 15000.00, 5050505),
(6, '2024-06-01', 6, 35000.00, 17500.00, 6060606),
(7, '2024-07-01', 7, 40000.00, 20000.00, 7070707);

-- #5
CREATE TABLE Creditos(
    idCreditos INT PRIMARY KEY,
    idPresupuesto INT NOT NULL,
    RangoInicial DATE,
    RangoFinal DATE,
    MontoTotal DECIMAL,
    idTipoDeCredito INT NOT NULL,
    FOREIGN KEY (idPresupuesto) REFERENCES Presupuesto(idPresupuesto),
    FOREIGN KEY (idTipoDeCredito) REFERENCES TipoDeCredito(idTipoDeCredito)
);
-- Insert de datos en la tabla Creditos
INSERT INTO Creditos (idCreditos, idPresupuesto, RangoInicial, RangoFinal, MontoTotal, idTipoDeCredito) 
VALUES 
(1, 1, '2021-03-07','2025-01-01', 5000.00, 1),
(2, 2, '2020-12-06','2026-02-01', 10000.00, 2),
(3, 3, '2023-08-05','2027-03-01', 7500.00, 3),
(4, 4, '2018-09-04','2028-04-01', 12500.00, 4),
(5, 5, '2003-07-03','2029-05-01', 15000.00, 5),
(6, 6, '2021-05-02','2030-06-01', 17500.00, 6),
(7, 7, '2019-01-01','2031-07-01', 20000.00, 7);

-- #6
CREATE TABLE Recordatorios(
    idRecordatorios INT PRIMARY KEY,
    Comentario VARCHAR(120),
    Cedula INT NOT NULL,  -- Conexión con la tabla Usuario
    FOREIGN KEY (Cedula) REFERENCES Usuario(Cedula)
);
-- Insert de datos en la tabla Recordatorios
INSERT INTO Recordatorios (idRecordatorios, Comentario, Cedula) 
VALUES 
(1, 'Pagar tarjeta de crédito', 1010101),
(2, 'Renovar seguro de vida', 2020202),
(3, 'Agendar cita médica', 3030303),
(4, 'Revisar estado de cuenta', 4040404),
(5, 'Comprar regalos de cumpleaños', 5050505),
(6, 'Preparar documentos de impuestos', 6060606),
(7, 'Renovar licencia de conducir', 7070707);

-- #7
CREATE TABLE TiposDeRecordatorios(
    idTiposDeRecordatorios INT PRIMARY KEY,
    TipoDeRecordatorio VARCHAR(50),
    idRecordatorios INT NOT NULL, -- Conexión con la tabla Recordatorios
    FOREIGN KEY (idRecordatorios) REFERENCES Recordatorios(idRecordatorios)
);
-- Insert de datos en la tabla TiposDeRecordatorios
INSERT INTO TiposDeRecordatorios (idTiposDeRecordatorios, TipoDeRecordatorio, idRecordatorios) 
VALUES 
(1, 'Pago', 1),
(2, 'Renovación', 2),
(3, 'Salud', 3),
(4, 'Revisión', 4),
(5, 'Compra', 5),
(6, 'Documentación', 6),
(7, 'Licencia', 7);

-- #8
CREATE TABLE Cuentas(
    idCuentas INT PRIMARY KEY,
    Banco TEXT,
    Monto DECIMAL,
    idPresupuesto INT NOT NULL,  -- Conexión con la tabla Presupuesto
    FOREIGN KEY (idPresupuesto) REFERENCES Presupuesto(idPresupuesto)
);
-- Insert de datos en la tabla Cuentas
INSERT INTO Cuentas (idCuentas, Banco, Monto, idPresupuesto) 
VALUES 
(1, 'Banco A', 5000.00, 1),
(2, 'Banco B', 10000.00, 2),
(3, 'Banco C', 15000.00, 3),
(4, 'Banco D', 20000.00, 4),
(5, 'Banco E', 25000.00, 5),
(6, 'Banco F', 30000.00, 6),
(7, 'Banco G', 35000.00, 7);

-- #9
CREATE TABLE PagoDeCredito(
    idPagoDeCredito INT PRIMARY KEY,
    TipoDePago VARCHAR(50),
    idCreditos INT NOT NULL,
    FOREIGN KEY (idCreditos) REFERENCES Creditos(idCreditos)
);
-- Insert de datos en la tabla PagoDeCredito
INSERT INTO PagoDeCredito (idPagoDeCredito, TipoDePago, idCreditos) 
VALUES 
(1, 'Efectivo', 1),
(2, 'Tarjeta débito', 2),
(3, 'Efectivo', 3),
(4, 'Tarjeta crédito', 4),
(5, 'Cheque', 5),
(6, 'Cheque', 6),
(7, 'Tarjeta crédito', 7);

-- #10
CREATE TABLE Gastos(
    idGastos INT PRIMARY KEY,
    idPresupuesto INT NOT NULL,
    FechaDeRegistro DATE,
    Monto DECIMAL,
    TipoDeMonto VARCHAR(50),
    FOREIGN KEY (idPresupuesto) REFERENCES Presupuesto(idPresupuesto)
);
-- Insert de datos en la tabla Gastos
INSERT INTO Gastos (idGastos, idPresupuesto, FechaDeRegistro, Monto, TipoDeMonto) 
VALUES 
(1, 1, '2021-01-02', 8441.00, 'fijo'),
(2, 2, '2022-02-04', 98754.00, 'variable'),
(3, 3, '2023-03-06', 56487.00, 'variable'),
(4, 4, '2024-04-08', 454874.00, 'variable'),
(5, 5, '2025-05-10', 198783.00, 'fijo'),
(6, 6, '2026-06-12', 457774.00, 'fijo'),
(7, 7, '2027-07-14', 56330.00, 'variable');

-- #11
CREATE TABLE Ingresos(
    idIngresos INT PRIMARY KEY,
    idPresupuesto INT NOT NULL,
    FechaDeRegistro DATE,
    Monto DECIMAL,
    TipoDeMonto VARCHAR(50),
    FOREIGN KEY (idPresupuesto) REFERENCES Presupuesto(idPresupuesto)
);
-- Insert de datos en la tabla Gastos
INSERT INTO Ingresos (idIngresos, idPresupuesto, FechaDeRegistro, Monto, TipoDeMonto) 
VALUES 
(1, 1, '2021-01-02', 465451.00, 'variable'),
(2, 2, '2022-02-04', 8971.00, 'fijo'),
(3, 3, '2023-03-06', 5477.00, 'fijo'),
(4, 4, '2024-04-08', 97000.00, 'fijo'),
(5, 5, '2025-05-10', 14547.00, 'variable'),
(6, 6, '2026-06-12', 99700.00, 'variable'),
(7, 7, '2027-07-14', 3421.00, 'fijo');

-- #12
CREATE TABLE Telefonos(
    idTelefono INT PRIMARY KEY,
    Cedula INT NOT NULL,
    Numero VARCHAR(15),
    FOREIGN KEY (Cedula) REFERENCES Usuario(Cedula)
);
-- Insert de datos en la tabla Telefonos
INSERT INTO Telefonos (idTelefono, Cedula, Numero)
VALUES 
(1, 1010101, 3278945610),
(2, 2020202, 3105478798),
(3, 3030303, 3011554879),
(4, 4040404, 3099889784),
(5, 5050505, 3009745221),
(6, 6060606, 3053041187),
(7, 7070707, 3105449284);

SHOW TABLES;