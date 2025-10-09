CREATE TABLE USUARIO (
	usuario_id INT NOT NULL PRIMARY KEY,
	nombre_usuario VARCHAR(50) NOT NULL,
	rol INT NOT NULL
);

CREATE TABLE TIPOS_NEGOCIO (
	tipo_neg_id INT NOT NULL PRIMARY KEY,
	nombre_tipo VARCHAR(50) NOT NULL
);

CREATE TABLE CATEGORIA_PRODUCTO (
	categoria_prod_id INT NOT NULL PRIMARY KEY,
	nombre_categoria VARCHAR (50) NOT NULL
);

CREATE TABLE NOMBRE_PRODUCTO (
	producto_id INT NOT NULL PRIMARY KEY,
	nombre_producto VARCHAR(70) NOT NULL,
	categoria_prod_id INT,
	FOREIGN KEY (categoria_prod_id) REFERENCES CATEGORIA_PRODUCTO (categoria_prod_id)
);

CREATE TABLE PRODUCTO_EN_VENTA (
	producto_venta_id INT NOT NULL PRIMARY KEY,
	precio_base INT NOT NULL,
	stock_disponible INT NOT NULL,
	unidad VARCHAR(25) DEFAULT '',
	porcentaje_descuento INT DEFAULT 0,
	producto_id INT,
	FOREIGN KEY (producto_id) REFERENCES NOMBRE_PRODUCTO (producto_id)
);

CREATE TABLE NEGOCIO (
	negocio_id INT NOT NULL PRIMARY KEY,
	nombre_negocio VARCHAR(50) NOT NULL,
	direccion_negocio VARCHAR(85) NOT NULL,
	latitud DECIMAL NOT NULL,
	longitud DECIMAL NOT NULL,
	usuario_id INT,
	tipo_neg_id INT,
	FOREIGN KEY (usuario_id) REFERENCES USUARIO (usuario_id),
	FOREIGN KEY (tipo_neg_id) REFERENCES TIPOS_NEGOCIO (tipo_neg_id)
);

CREATE TABLE PEDIDO (
	pedido_id INT NOT NULL PRIMARY KEY,
	monto_total INT NOT NULL,
	direccion_negocio VARCHAR(85) NOT NULL,
	usuario_id INT,
	negocio_id INT,
	FOREIGN KEY (usuario_id) REFERENCES USUARIO (usuario_id),
	FOREIGN KEY (negocio_id) REFERENCES NEGOCIO (negocio_id)
);

CREATE TABLE DETALLE_PEDIDO (
	detalle_id INT NOT NULL PRIMARY KEY,
	cantidad INT NOT NULL,
	direccion_negocio VARCHAR(85) NOT NULL,
	pedido_id INT,
	producto_venta_id INT,
	FOREIGN KEY (pedido_id) REFERENCES PEDIDO (pedido_id),
	FOREIGN KEY (producto_venta_id) REFERENCES PRODUCTO_EN_VENTA (producto_venta_id)
);