BEGIN TRANSACTION;

-- Tabla de usuarios (clientes, administradores, trabajadores)
CREATE TABLE IF NOT EXISTS "Usuario" (
    "usuario_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "correo_electronico" TEXT NOT NULL UNIQUE,
    "telefono" TEXT,
    "rol" TEXT NOT NULL CHECK(rol IN ('cliente','administrador','trabajador')),
    "contraseña" TEXT NOT NULL
);

-- Tabla de hotel
CREATE TABLE IF NOT EXISTS "Hotel" (
    "hotel_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "categoria" TEXT
);

-- Tabla de habitaciones
CREATE TABLE IF NOT EXISTS "Habitacion" (
    "habitacion_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "hotel_id" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "capacidad" INTEGER NOT NULL,
    "precio" REAL NOT NULL,
    FOREIGN KEY("hotel_id") REFERENCES "Hotel"("hotel_id")
);

-- Tabla de reservas
CREATE TABLE IF NOT EXISTS "Reserva" (
    "reserva_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "usuario_id" INTEGER NOT NULL,
    "habitacion_id" INTEGER NOT NULL,
    "fecha_entrada" DATE NOT NULL,
    "fecha_salida" DATE NOT NULL,
    "cantidad_personas" INTEGER NOT NULL,
    FOREIGN KEY("usuario_id") REFERENCES "Usuario"("usuario_id"),
    FOREIGN KEY("habitacion_id") REFERENCES "Habitacion"("habitacion_id")
);

--Tabla de reseñas

CREATE TABLE IF NOT EXISTS "Resena" (
    "resena_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "usuario_id" INTEGER NOT NULL,
    "hotel_id" INTEGER NOT NULL,
    "comentario" TEXT NOT NULL,
    "puntuacion" INTEGER NOT NULL CHECK(puntuacion BETWEEN 1 AND 5),
    FOREIGN KEY("usuario_id") REFERENCES "Usuario"("usuario_id"),
    FOREIGN KEY("hotel_id") REFERENCES "Hotel"("hotel_id")
);

-- Tabla de pagos
CREATE TABLE IF NOT EXISTS "Pago" (
    "pago_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "reserva_id" INTEGER NOT NULL,
    "monto" INTEGER NOT NULL,
    FOREIGN KEY("reserva_id") REFERENCES "Reserva"("reserva_id")
);


----Poblando
INSERT INTO Usuario (nombre, apellido, correo_electronico, telefono, rol, contraseña)
VALUES ('George', 'Solo', 'george.solo@hotelreef.com', '123456789', 'administrador', 'claveSecreta123');

INSERT INTO Usuario (nombre, apellido, correo_electronico, telefono, rol, contraseña)
VALUES ('Aurora', 'Godoy', 'aurora.godoy@gmail.com', '987654321', 'cliente', 'clave456');

INSERT INTO Usuario (nombre, apellido, correo_electronico, telefono, rol, contraseña)
VALUES ('Ernesto', 'Fuentes', 'ernesto.fuentes@hotelreef.com', '555123456', 'trabajador', 'clave789');
