create database BD_Restaurante_IO2;

use BD_Restaurante_IO2;

create table USUARIO (
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(20),
apellido varchar(30) not null,
telefono char(9) null,
direccion varchar(30) null,
ciudad varchar(30) null,
codigo_postal char(5) null,
rol varchar(30)
);
CREATE TABLE CLIENTE (
   id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20),
    Apellido VARCHAR(30),
    Calle VARCHAR(20),
    Ciudad VARCHAR(20),
    CodigoPostal CHAR(5),
    EstadoCliente VARCHAR(20) DEFAULT 'no verificado',
    CHECK (EstadoCliente IN ('verificado', 'no verificado'))
);
CREATE TABLE TELEFONOCLIENTE (
    NumeroTelefono CHAR(9) PRIMARY KEY,
    id_cliente int,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE DetallesBancarios (
    CodigoBanco CHAR(4) PRIMARY KEY,
    NombreBanco VARCHAR(30)
);


CREATE TABLE PersonalConductor (
    id_personalC CHAR(10) PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(30)null,
    Calle VARCHAR(20) null,
    Ciudad VARCHAR(20) null,
    CodigoPostal CHAR(5) null,
    NumeroIdentificacionFiscal CHAR(9) NOT NULL,
    CodigoBanco CHAR(4) NOT NULL,
    NumeroCuenta VARCHAR(20),
    EstadoPersonal VARCHAR(20) DEFAULT 'Conductor',
    TasaPago FLOAT,
    NumeroLicencia CHAR(12) NOT NULL,
    FOREIGN KEY (CodigoBanco) REFERENCES DetallesBancarios(CodigoBanco) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE PersonalRestaurant (
    id_personalR CHAR(10) PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(30),
    Calle VARCHAR(20),
    Ciudad VARCHAR(20),
    NumeroIdentificacionFiscal CHAR(9) NOT NULL,
    CodigoBanco CHAR(4) NOT NULL,
    NumeroCuenta VARCHAR(20),
    EstadoPersonal VARCHAR(20) DEFAULT 'en Restaurant',
    TasaPago FLOAT,
    FOREIGN KEY (CodigoBanco) REFERENCES DetallesBancarios(CodigoBanco) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Mesas (
    NumeroMesa CHAR(5) PRIMARY KEY,
    Capacidad INT
);

CREATE TABLE Reservas (
    Id_Reserva int PRIMARY KEY,
    NumeroMesa CHAR(5),
    FechaReserva DATE,
    HoraInicio TIME,
    HoraFin TIME,
    FOREIGN KEY (NumeroMesa) REFERENCES Mesas(NumeroMesa) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE PagoPedido (
    NumeroAprobacionPago CHAR(8) PRIMARY KEY,
    MetodoPago VARCHAR(20),
    MontoTotal FLOAT
);

CREATE TABLE Pedidos (
    NumeroPedido CHAR(10) PRIMARY KEY,
    id_personalR CHAR(10) NOT NULL,
    id_cliente int ,
    NumeroMesa CHAR(5),
    FechaHoraPedido DATETIME,
    TipoPedido VARCHAR(10),
    NumeroAprobacionPago CHAR(8) NOT NULL,
    Estado VARCHAR(10),
    FOREIGN KEY (id_personalR) REFERENCES PersonalRestaurant(id_personalR) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES ClIENTE(id_cliente) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (NumeroAprobacionPago) REFERENCES PagoPedido(NumeroAprobacionPago) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (NumeroMesa) REFERENCES Mesas(NumeroMesa) ON UPDATE CASCADE ON DELETE NO ACTION
);
/*para los que van al mismo restaurant a hacer su pedido*/

CREATE TABLE PedidoEnRestaurant (
    NumeroPedido CHAR(10) PRIMARY KEY,
    HoraLlegada DATETIME,
    FOREIGN KEY (NumeroPedido) REFERENCES Pedidos(NumeroPedido) ON UPDATE CASCADE ON DELETE NO ACTION
);
/*------pedido por llamada*/
CREATE TABLE PedidoTelefono (
    NumeroPedido CHAR(10) PRIMARY KEY,
    HoraInicioTelefono DATETIME,
    HoraFinTelefono DATETIME,
    FOREIGN KEY (NumeroPedido) REFERENCES Pedidos(NumeroPedido) ON UPDATE CASCADE ON DELETE NO ACTION
);
/*---pago al conductor*/
CREATE TABLE PagoConductor (
    id_SalarioPC CHAR(10) PRIMARY KEY,
    SalarioBruto FLOAT,
    ImpuestoRetenido FLOAT,
    SalarioTotal FLOAT,
    FechaInicioSalario DATE,
    FechaFinSalario DATE
);
/*---pago a los meseros,cajeros*/
CREATE TABLE PagoRestaurant (
    id_SalarioPR CHAR(10) PRIMARY KEY,
    SalarioBruto FLOAT,
    ImpuestoRetenido FLOAT,
    SalarioTotal FLOAT,
    FechaInicioSalario DATE,
    FechaFinSalario DATE
);
/*----cambio de turno de conductor*/
CREATE TABLE TurnoConductor (
    id_Turno CHAR(5) PRIMARY KEY,
    id_PersonalTC CHAR(10) NOT NULL,
    id_Salario CHAR(10) NOT NULL,
    FechaHoraInicio DATETIME,
    FechaHoraFin DATETIME,
    TipoTurno VARCHAR(20) DEFAULT 'Tiempo Completo',
    FOREIGN KEY (id_PersonalTC) REFERENCES PersonalConductor(id_personalC) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (id_Salario) REFERENCES PagoConductor(id_SalarioPC) ON UPDATE CASCADE ON DELETE NO ACTION
);
/*---cambio turno de empleados que se encargan de atender en el restaurant*/
CREATE TABLE TurnoRestaurant (
    id_TurnoR CHAR(5) PRIMARY KEY,
    id_PersonalR CHAR(10),
    id_Salario CHAR(10),
    FechaHoraInicio DATETIME,
    FechaHoraFin DATETIME,
    TipoTurno VARCHAR(30) DEFAULT 'Tiempo Completo',
    FOREIGN KEY (id_PersonalR) REFERENCES PersonalRestaurant(id_PersonalR) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (id_Salario) REFERENCES PagoRestaurant(id_SalarioPR) ON UPDATE CASCADE ON DELETE NO ACTION
);

/*---Entrega del pedido*/
CREATE TABLE Entrega (
    NumeroPedido CHAR(10) PRIMARY KEY,
    HoraEntrega DATETIME,
    FOREIGN KEY (NumeroPedido) REFERENCES PedidoTelefono(NumeroPedido) ON UPDATE CASCADE ON DELETE NO ACTION
);

/*--hora que recogio su pedido*/
CREATE TABLE Recogida (
    NumeroPedido CHAR(10) PRIMARY KEY,
    HoraRecogida TIME,
    FOREIGN KEY (NumeroPedido) REFERENCES PedidoTelefono(NumeroPedido) ON UPDATE CASCADE ON DELETE NO ACTION
);
/*---menu del restaurant*/

CREATE TABLE ElementodeMenu (
    Codigo_menu CHAR(5) PRIMARY KEY,
    Nombre_menu VARCHAR(20),
    Descripcion VARCHAR(30),
    Precio_menu FLOAT
);
/*---platos del menu*/
CREATE TABLE PedidoMenu (
    NumeroPedido CHAR(10),
    Codigo_menu CHAR(5),
    stock INT,
    PRIMARY KEY (NumeroPedido, Codigo_menu),
    FOREIGN KEY (NumeroPedido) REFERENCES Pedidos(NumeroPedido) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (Codigo_menu) REFERENCES ElementodeMenu(Codigo_menu) ON UPDATE CASCADE ON DELETE NO ACTION
);



