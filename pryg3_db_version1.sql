
--Tablas creadas en sqlite v1

BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Cliente" (
	"cliente_id"	INTEGER,
	"nombre"	TEXT NOT NULL,
	"apellido"	TEXT NOT NULL,
	"correo_electronico"	TEXT NOT NULL UNIQUE,
	"telefono"	TEXT,
	PRIMARY KEY("cliente_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Habitacion" (
	"habitacion_id"	INTEGER,
	"hotel_id"	INTEGER NOT NULL,
	"tipo"	TEXT NOT NULL,
	"capacidad"	INTEGER NOT NULL,
	"precio"	REAL NOT NULL,
	PRIMARY KEY("habitacion_id" AUTOINCREMENT),
	FOREIGN KEY("hotel_id") REFERENCES "Hotel"("hotel_id")
);
CREATE TABLE IF NOT EXISTS "Hotel" (
	"hotel_id"	INTEGER,
	"nombre"	TEXT NOT NULL,
	"direccion"	TEXT NOT NULL,
	"categoria"	TEXT,
	PRIMARY KEY("hotel_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Reserva" (
	"reserva_id"	INTEGER,
	"cliente_id"	INTEGER NOT NULL,
	"habitacion_id"	INTEGER NOT NULL,
	"fecha_entrada"	DATE NOT NULL,
	"fecha_salida"	DATE NOT NULL,
	"cantidad_personas"	INTEGER NOT NULL,
	PRIMARY KEY("reserva_id" AUTOINCREMENT),
	FOREIGN KEY("cliente_id") REFERENCES "Cliente"("cliente_id"),
	FOREIGN KEY("habitacion_id") REFERENCES "Habitacion"("habitacion_id")
);
COMMIT;
