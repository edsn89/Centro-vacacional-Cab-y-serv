CREATE TABLE usuarios (
usua_id numeric PRIMARY KEY,
usua_cedula numeric(20) NOT NULL,
usua_primernombre varchar(50) NOT NULL,
usua_segundonombre varchar(50) NULL,
usua_primerapellido varchar(50) NOT NULL,
usua_segundoapellido varchar(50) NOT NULL,
usua_telefono varchar(50) NOT NULL,
usua_direccion varchar(50) NOT NULL,
usua_fechanacimiento date NOT NULL,
usua_usuario varchar(50) NOT NULL,
usua_clave varchar(50) NOT NULL
);
 
CREATE TABLE servicio (
serv_id numeric PRIMARY KEY,
serv_nombre varchar(50) NOT NULL,
serv_descripcion varchar(100) NOT NULL,
serv_precio float NOT NULL
);
 
CREATE TABLE tipocab (
tc_id numeric PRIMARY KEY,
tc_nombre varchar(50) NOT NULL,
tc_descripcion varchar(100) NOT NULL,
tc_precio float NOT NULL
);
 
CREATE TABLE cabania (
cab_id numeric PRIMARY KEY,
cab_numero varchar(50) NOT NULL,
cab_estado varchar(50) NOT NULL,
tc_id numeric REFERENCES tipocab(tc_id)
);
 
 
 
CREATE TABLE reserva_s (
rs_id numeric NOT NULL PRIMARY KEY,
rs_estado varchar(50) NOT NULL,
usua_id numeric(10) NOT NULL,
FOREIGN KEY (usua_id) REFERENCES usuarios (usua_id)
);
 
CREATE TABLE servicio_r(
sr_id numeric NOT NULL PRIMARY KEY,
sr_fecha date NOT NULL,
sr_cantidad numeric(50) NOT NULL,
sr_precioT float NOT NULL,
rs_id numeric NOT NULL,
serv_id numeric(10) NOT NULL,
FOREIGN KEY (serv_id) REFERENCES servicio (serv_id),
FOREIGN KEY (rs_id) REFERENCES reserva_s(rs_id)
);
 
CREATE TABLE reserva_c (
rc_id numeric NOT NULL PRIMARY KEY,
rc_estado varchar(50) NOT NULL,
usua_id numeric(10) NOT NULL,
FOREIGN KEY (usua_id) REFERENCES usuarios (usua_id)
);
 
 
CREATE TABLE cabania_r(
cr_id numeric NOT NULL PRIMARY KEY,
cr_fechaentrada date NOT NULL,
cr_fechasalida date NOT NULL,
rc_id numeric NOT NULL,
cab_id numeric(10) NOT NULL,
FOREIGN KEY (rc_id) REFERENCES reserva_c (rc_id),
FOREIGN KEY (cab_id) REFERENCES cabania (cab_id)
);
 
CREATE TABLE factura (
fac_id serial PRIMARY KEY,
fac_fecha date NOT NULL,
fac_precio float NOT NULL,
rc_id numeric(10),
rs_id numeric(10),
FOREIGN KEY (rc_id) REFERENCES reserva_c (rc_id),
FOREIGN KEY (rs_id) REFERENCES reserva_s (rs_id)
);
 
 
 
CREATE TABLE rol (
rol_id numeric,
rol_descripcion varchar(50) NOT NULL,
PRIMARY KEY (rol_id)
);
 
 
CREATE TABLE usuariorol (
usrol_id numeric,
rol_id numeric NOT NULL,
usua_id numeric NOT NULL,
PRIMARY KEY (usrol_id),
FOREIGN KEY (usua_id) REFERENCES usuarios (usua_id),
FOREIGN KEY (rol_id) REFERENCES rol (rol_id)
);


CREATE TABLE temporal_servicio_r(
tempsr_id numeric NOT NULL PRIMARY KEY,
usua_id numeric(10) NOT NULL,
usua_cedula numeric(10) NOT NULL,
serv_id numeric(10) NOT NULL,
sr_fecha date NOT NULL,
sr_cantidad numeric(50) NOT NULL,
sr_precioT float NOT NULL
);

CREATE TABLE temporal_cabania_r(
tempcr_id numeric NOT NULL PRIMARY KEY,
usua_id numeric(10) NOT NULL,
usua_cedula numeric(10) NOT NULL,
cr_fechaentrada date NOT NULL,
cr_fechasalida date NOT NULL,
tc_id numeric(10) NOT NULL,
cr_cantidad numeric(50) NOT NULL,
cr_precioT float NOT NULL
);