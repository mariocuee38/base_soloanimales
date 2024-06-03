-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS zoologico;
USE zoologico;

-- Crear tabla Empleados
CREATE TABLE Empleados (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Tipo ENUM('Cuidador', 'Limpiador') NOT NULL
);

-- Crear tabla Hábitat
CREATE TABLE Habitat (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    CuidadorID INT,
    LimpiadorID INT,
    FOREIGN KEY (CuidadorID) REFERENCES Empleados(ID),
    FOREIGN KEY (LimpiadorID) REFERENCES Empleados(ID)
);

-- Crear tabla Animales
CREATE TABLE Animales (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Especie VARCHAR(255) NOT NULL,
    Edad INT NOT NULL,
    HabitatID INT,
    FOREIGN KEY (HabitatID) REFERENCES Habitat(ID)
);

-- Crear tabla Cuidador
CREATE TABLE Cuidador (
    EmpleadoID INT PRIMARY KEY,
    Recinto INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(ID),
    FOREIGN KEY (Recinto) REFERENCES Habitat(ID)
);

-- Crear tabla Limpiador
CREATE TABLE Limpiador (
    EmpleadoID INT PRIMARY KEY,
    Recinto1 INT,
    Recinto2 INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(ID),
    FOREIGN KEY (Recinto1) REFERENCES Habitat(ID),
    FOREIGN KEY (Recinto2) REFERENCES Habitat(ID)
);

-- Insertar datos en Empleados
INSERT INTO Empleados (Nombre, Tipo) VALUES ('Juan Pérez', 'Cuidador');
INSERT INTO Empleados (Nombre, Tipo) VALUES ('María López', 'Cuidador');
INSERT INTO Empleados (Nombre, Tipo) VALUES ('Carlos García', 'Cuidador');
INSERT INTO Empleados (Nombre, Tipo) VALUES ('Ana Fernández', 'Cuidador');
INSERT INTO Empleados (Nombre, Tipo) VALUES ('Luis Martínez', 'Limpiador');
INSERT INTO Empleados (Nombre, Tipo) VALUES ('Sofía Rodríguez', 'Limpiador');

-- Insertar datos en Habitat
INSERT INTO Habitat (Nombre, CuidadorID, LimpiadorID) VALUES ('Selva Tropical', 1, 5);
INSERT INTO Habitat (Nombre, CuidadorID, LimpiadorID) VALUES ('Desierto', 2, 5);
INSERT INTO Habitat (Nombre, CuidadorID, LimpiadorID) VALUES ('Sabana', 3, 6);
INSERT INTO Habitat (Nombre, CuidadorID, LimpiadorID) VALUES ('Bosque', 4, 6);

-- Insertar datos en Cuidador
INSERT INTO Cuidador (EmpleadoID, Recinto) VALUES (1, 1);
INSERT INTO Cuidador (EmpleadoID, Recinto) VALUES (2, 2);
INSERT INTO Cuidador (EmpleadoID, Recinto) VALUES (3, 3);
INSERT INTO Cuidador (EmpleadoID, Recinto) VALUES (4, 4);

-- Insertar datos en Limpiador
INSERT INTO Limpiador (EmpleadoID, Recinto1, Recinto2) VALUES (5, 1, 2);
INSERT INTO Limpiador (EmpleadoID, Recinto1, Recinto2) VALUES (6, 3, 4);

-- Insertar datos en Animales
INSERT INTO Animales (Nombre, Especie, Edad, HabitatID) VALUES ('León', 'Panthera leo', 5, 3);
INSERT INTO Animales (Nombre, Especie, Edad, HabitatID) VALUES ('Tigre', 'Panthera tigris', 4, 1);
INSERT INTO Animales (Nombre, Especie, Edad, HabitatID) VALUES ('Elefante', 'Loxodonta', 10, 3);
INSERT INTO Animales (Nombre, Especie, Edad, HabitatID) VALUES ('Cebra', 'Equus quagga', 7, 3);
