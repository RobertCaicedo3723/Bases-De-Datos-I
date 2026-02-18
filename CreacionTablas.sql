-- Base de Datos de Sistema de Cine
-- Crear y usar la base de datos
-- Tabla GENERO
CREATE TABLE GENERO (
    Id_genero INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE DISTRIBUIDOR (
    Id_distr INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(70) NOT NULL,
    Contacto VARCHAR(70)
);

CREATE TABLE PELICULA (
    Id_peli INT NOT NULL PRIMARY KEY,
    Duracion INT NOT NULL,
    Clasificacion VARCHAR(20),
    Nombre_P VARCHAR(100) NOT NULL,
    Id_distr1 INT,
    Id_genero1 INT,
    FOREIGN KEY (Id_distr1) REFERENCES DISTRIBUIDOR(Id_distr),
    FOREIGN KEY (Id_genero1) REFERENCES GENERO(Id_genero)
);

CREATE TABLE CINE (
    Id_cin INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(150) NOT NULL,
    Capacidad INT ,
    Contacto VARCHAR(50) 
);

CREATE TABLE SALA (
    Id_sala INT NOT NULL PRIMARY KEY,
    Nombre_sa VARCHAR(50),
    Capacidad INT NOT NULL,
    Tipo VARCHAR(50),
    Id_cin1 INT,
    FOREIGN KEY (Id_cin1) REFERENCES CINE(Id_cin)
);

CREATE TABLE TIPO_FUNCION (
    Id_tipofuncion INT PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL,
    Descripcion VARCHAR(200)
);

CREATE TABLE FUNCION (
    Id_fun INT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Id_espec1 INT,
    Id_sala1 INT,
    Id_peli1 INT,
    Id_tipofuncion1 INT,
    FOREIGN KEY (Id_sala1) REFERENCES SALA(Id_sala),
    FOREIGN KEY (Id_peli1) REFERENCES PELICULA(Id_peli),
    FOREIGN KEY (Id_tipofuncion1) REFERENCES TIPO_FUNCION(Id_tipofuncion)
);

CREATE TABLE CLIENTE (
    Id_Clie INT PRIMARY KEY,
    Nombre VARCHAR(70) NOT NULL,
    Correo VARCHAR(100),
    Telefono BIGINT,
    Id_mem1 INT
);

CREATE TABLE MEMBRESIA (
    Id_mem INT PRIMARY KEY,
    Tipo VARCHAR(60),
    Descuento DECIMAL(5,2),
    Duracion INT
);

-- Agregar la clave for nea a CLIENTE despu s de crear MEMBRESIA
ALTER TABLE CLIENTE
ADD FOREIGN KEY (Id_mem1) REFERENCES MEMBRESIA(Id_mem);

CREATE TABLE RESERVA (
    Id_res INT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Estado VARCHAR(30),
    Id_fun1 INT,
    Id_Clie1 INT,
    FOREIGN KEY (Id_fun1) REFERENCES FUNCION(Id_fun),
    FOREIGN KEY (Id_Clie1) REFERENCES CLIENTE(Id_Clie)
);

CREATE TABLE BOLETO (
    Id_bol INT PRIMARY KEY,
    Asiento VARCHAR(15),
    Precio DECIMAL(10,2) NOT NULL,
    Id_clie2 INT,
    Id_fun2 INT,
    FOREIGN KEY (Id_clie2) REFERENCES CLIENTE(Id_Clie),
    FOREIGN KEY (Id_fun2) REFERENCES FUNCION(Id_fun)
);

CREATE TABLE PROMOCION (
    Id_prom INT PRIMARY KEY,
    Descripcion VARCHAR(200),
    Descuento DECIMAL(5,2) NOT NULL
);

-- Tabla BOLETO_PROMOCION (relaci n muchos a muchos)
CREATE TABLE BOLETO_PROMOCION (
    Id_bol1 INT,
    Id_prom1 INT,
    PRIMARY KEY (Id_bol1, Id_prom1),
    FOREIGN KEY (Id_bol1) REFERENCES BOLETO(Id_bol),
    FOREIGN KEY (Id_prom1) REFERENCES PROMOCION(Id_prom)
);

-- Tabla ESPECIALIDAD
CREATE TABLE ESPECIALIDAD (
    Id_especialidad INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla ARTISTA
CREATE TABLE ARTISTA (
    Id_art INT PRIMARY KEY,
    Nombre VARCHAR(70) NOT NULL,
    Nacionalidad VARCHAR(50),
    Id_especialidad1 INT,
    FOREIGN KEY (Id_especialidad1) REFERENCES ESPECIALIDAD(Id_especialidad)
);

-- Tabla ARTISTA_ESPECTACULO (relaci n muchos a muchos)
CREATE TABLE ARTISTA_ESPECTACULO (
    Id_art1 INT,
    Id_espec2 INT,
    PRIMARY KEY (Id_art1, Id_espec2),
    FOREIGN KEY (Id_art1) REFERENCES ARTISTA(Id_art)
);

-- Tabla TIPO_ESPECTACULO
CREATE TABLE TIPO_ESPECTACULO (
    Id_tipoespec INT PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL,
    Descripcion VARCHAR(200)
);

-- Tabla ESPECTACULO
CREATE TABLE ESPECTACULO (
    Id_espec INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Duracion DECIMAL(5,2),
    Id_tipoespec1 INT,
    FOREIGN KEY (Id_tipoespec1) REFERENCES TIPO_ESPECTACULO(Id_tipoespec)
);

-- Agregar la clave for nea a FUNCION despu s de crear ESPECTACULO
ALTER TABLE FUNCION
ADD FOREIGN KEY (Id_espec1) REFERENCES ESPECTACULO(Id_espec);

-- Agregar la clave for nea a ARTISTA_ESPECTACULO despu s de crear ESPECTACULO
ALTER TABLE ARTISTA_ESPECTACULO
ADD FOREIGN KEY (Id_espec2) REFERENCES ESPECTACULO(Id_espec);

-- Tabla PRODUCTOR
CREATE TABLE PRODUCTOR (
    Id_prod INT PRIMARY KEY,
    Nombre VARCHAR(70) NOT NULL,
    Contacto VARCHAR(50)
);

-- Tabla PRODUCTOR_ESPECTACULO (relaci n muchos a muchos)
CREATE TABLE PRODUCTOR_ESPECTACULO (
    Id_prod2 INT,
    Id_espec1 INT,
    PRIMARY KEY (Id_prod2, Id_espec1),
    FOREIGN KEY (Id_prod2) REFERENCES PRODUCTOR(Id_prod),
    FOREIGN KEY (Id_espec1) REFERENCES ESPECTACULO(Id_espec)
);

