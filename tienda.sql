

-- CREAR TABLA CLIENTES

CREATE TABLE clientes(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NULL,
    direccion VARCHAR(100) NULL,
    contrasena Varchar(20) NULL,
    cedula varchar(13) NULL,
    PRIMARY KEY (id_cliente)
)  ENGINE=InnoDB;

-- CREAR TABLA FORMA_PAGOS
CREATE TABLE forma_pagos(
    id_forma_pago INT NOT NULL AUTO_INCREMENT,
    descripcion int null,
    detalle varchar(10) NULL,
    PRIMARY KEY (id_forma_pago)
)  ENGINE=InnoDB;

-- CREAR TABLA FACTURAS
CREATE TABLE facturas(
    id_factura INT NOT NULL AUTO_INCREMENT,
    fecha DATE null,
    id_cliente INT NOT NULL,
    id_forma_pago INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    CONSTRAINT id_forma_pago FOREIGN KEY (id_forma_pago) REFERENCES forma_pagos (id_forma_pago)
)  ENGINE=InnoDB;

-- CREAR TABLA CATEGORIAS
CREATE TABLE categorias(
    id_categoria INT NOT NULL AUTO_INCREMENT,
    categoria int NOT NULL,
    descripcion VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_categoria)
)  ENGINE=InnoDB;

-- CREAR TABLA PROVEEDORES
CREATE TABLE proveedores(
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre varchar(30) NOT NULL,
    pais varchar(30) NOT NULL,
    ciudad varchar(30) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    direccion varchar(100) NOT NULL,
    PRIMARY KEY (id_proveedor)
)  ENGINE=InnoDB;

-- CREAR TABLA PRODUCTOS

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    precio DECIMAL(18 , 2 ) NOT NULL,
    stock int not null,
    fecha_elaboracion date not null,
    fecha_vencimiento date not null,
    id_categoria int not null,
    id_proveedor int not null,
    PRIMARY KEY (id_producto),
    CONSTRAINT id_proveedor FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor),
    CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
)  ENGINE=InnoDB;


-- CREAR TABLA DETALLEVENTAS

CREATE  TABLE detalle_factura
 (
  id_detalle_factura INT NOT NULL AUTO_INCREMENT ,
  numero_factura INT NOT NULL,
  cantidad INT NOT NULL,
  valor_total DECIMAL(18,2),
  id_producto INT NOT NULL,
  PRIMARY KEY (id_detalle_factura) ,
CONSTRAINT id_producto FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
)ENGINE=InnoDB;


 -- CREAR TABLA PAGOS
CREATE TABLE pagos(
    id_pago INT NOT NULL AUTO_INCREMENT,
    fecha date NOT NULL,
    monto DECIMAL(18,2) NOT NULL,
    id_detalle_factura int not null,
    PRIMARY KEY (id_pago),
    CONSTRAINT id_detalle_factura FOREIGN KEY (id_detalle_factura) REFERENCES detalle_factura(id_detalle_factura)
)  ENGINE=InnoDB;
