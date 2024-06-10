-- Crear la tabla Usuario
CREATE TABLE Usuario (
    email_usr CHAR(255) PRIMARY KEY,
    pwd_usr CHAR(255) NOT NULL,
    nombre_usr CHAR(255) NOT NULL,
    estudios_usr CHAR(255),
    especialidades_usr CHAR(255)
);

-- Crear la tabla Informacion_Paciente
CREATE TABLE Informacion_Paciente (
    id_paciente INT PRIMARY KEY,
    nombre_paciente CHAR(255) NOT NULL,
    edad INT,
    sexo CHAR(1),
    enfermedades_cronicas CHAR(255),
    alergias CHAR(255),
    datos_medicos CHAR(255),
    Usuario_email_usr CHAR(255),
    FOREIGN KEY (Usuario_email_usr) REFERENCES Usuario(email_usr)
);

-- Crear la tabla Historial_Medico
CREATE TABLE Historial_Medico (
    id_expediente INT,
    Informacion_Paciente_id_paciente INT,
    informacion_salud CHAR(255),
    datos_paciente CHAR(255),
    datos_reales TEXT, 
    autorizacion_paciente BOOLEAN,
    PRIMARY KEY (id_expediente, Informacion_Paciente_id_paciente),
    FOREIGN KEY (Informacion_Paciente_id_paciente) REFERENCES Informacion_Paciente(id_paciente)
);

-- Crear la tabla Cita
CREATE TABLE Cita (
    id_cita INT PRIMARY KEY,
    Informacion_Paciente_id_paciente INT,
    dia DATE,
    hora TIMESTAMP,
    Usuario_email_usr CHAR(255),
    FOREIGN KEY (Informacion_Paciente_id_paciente) REFERENCES Informacion_Paciente(id_paciente),
    FOREIGN KEY (Usuario_email_usr) REFERENCES Usuario(email_usr)
);

-- Crear la tabla Articulo_Inventario
CREATE TABLE Articulo_Inventario (
    id_articulo INT PRIMARY KEY,
    nombre_articulo CHAR(255) NOT NULL,
    cantidad INT,
    Usuario_email_usr CHAR(255),
    FOREIGN KEY (Usuario_email_usr) REFERENCES Usuario(email_usr)
);

-- Crear índices (opcional para mejorar el rendimiento)
CREATE INDEX Cita_IDX ON Cita (Usuario_email_usr);
CREATE INDEX Articulo_Inventario_IDX ON Articulo_Inventario (Usuario_email_usr);
