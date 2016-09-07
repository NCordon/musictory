CREATE TABLE catalogo
(
  id INTEGER PRIMARY KEY NOT NULL,
  titulo VARCHAR2(255),
  grupo VARCHAR2(255),
  genero VARCHAR2(255),
  portada_file_name VARCHAR2(255)
);


CREATE TABLE cd
(
  id INTEGER PRIMARY KEY NOT NULL,
  cantidad INTEGER,
  catalogo_id INTEGER REFERENCES catalogo(id),
  precio NUMBER(5,2)
);


CREATE TABLE vinilo
(
  id INTEGER PRIMARY KEY NOT NULL,
  cantidad INTEGER,
  catalogo_id INTEGER REFERENCES catalogo(id),
  precio NUMBER(5,2)
);


CREATE TABLE venta
(
  id INTEGER PRIMARY KEY NOT NULL,
  catalogo_id INTEGER REFERENCES catalogo(id),
  precio NUMBER(5,2),
  fechaVenta DATE,
  formato INTEGER,
  observaciones VARCHAR2(255)
);


CREATE TABLE pedido
(
  id INTEGER PRIMARY KEY NOT NULL,
  cantidad INTEGER,
  fechaRealizacion DATE,
  fechaEntrada DATE,
  fechaCancelacion DATE,
  formato INTEGER,
  titulo VARCHAR2(255),
  grupo VARCHAR2(255)
);
