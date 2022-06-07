--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      AUTOS.DM1
-- Author :       Jorge
--
-- Date Created : Tuesday, June 07, 2022 05:22:42
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: MARCA_R_CAEH_S2 
--

CREATE TABLE MARCA_R_CAEH_S2(
    MARCA_ID       NUMBER(3, 0)     NOT NULL,
    CLAVE          VARCHAR2(50)     NOT NULL,
    DESCRIPCION    VARCHAR2(500)    NOT NULL,
    ACTIVO         NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (MARCA_ID)
)
;



-- 
-- TABLE: MODELO_R_CAEH_S2 
--

CREATE TABLE MODELO_R_CAEH_S2(
    MODELO_ID      NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(50)     NOT NULL,
    DESCRIPCION    VARCHAR2(500)    NOT NULL,
    ACTIVO         NUMBER(1, 0),
    MARCA_ID       NUMBER(3, 0)     NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (MODELO_ID), 
    CONSTRAINT RefMARCA_R_CAEH_S216 FOREIGN KEY (MARCA_ID)
    REFERENCES MARCA_R_CAEH_S2(MARCA_ID)
)
;



-- 
-- TABLE: PAIS_F2_CAEH_S2 
--

CREATE TABLE PAIS_F2_CAEH_S2(
    PAIS_ID    NUMBER(4, 0)    NOT NULL,
    NOMBRE     VARCHAR2(40)    NOT NULL,
    CLAVE      VARCHAR2(4)     NOT NULL,
    REGION     VARCHAR2(3)     NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: SUCURSAL_F3_CAEH_S2 
--

CREATE TABLE SUCURSAL_F3_CAEH_S2(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    NOMBRE               VARCHAR2(40)     NOT NULL,
    CLAVE                VARCHAR2(8)      NOT NULL,
    SUCURSAL_ANEXA_ID    NUMBER(10, 0),
    PAIS_ID              NUMBER(4, 0)     NOT NULL,
    CONSTRAINT AGENCIA_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT RefPAIS_F2_CAEH_S214 FOREIGN KEY (PAIS_ID)
    REFERENCES PAIS_F2_CAEH_S2(PAIS_ID)
)
;



-- 
-- TABLE: STATUS_AUTO 
--

CREATE TABLE STATUS_AUTO(
    STATUS_AUTO_ID    NUMBER(2, 0)    NOT NULL,
    CLAVE             VARCHAR2(20)    NOT NULL,
    DESCRIPCION       VARCHAR2(40)    NOT NULL,
    CONSTRAINT STATUS_AUTO_PK PRIMARY KEY (STATUS_AUTO_ID)
)
;



-- 
-- TABLE: AUTO_F3_CAEH_S2 
--

CREATE TABLE AUTO_F3_CAEH_S2(
    AUTO_ID           NUMBER(10, 0)    NOT NULL,
    ANIO              NUMBER(4, 0)     NOT NULL,
    NUM_SERIE         VARCHAR2(20)     NOT NULL,
    TIPO              CHAR(1)          NOT NULL,
    PRECIO            NUMBER(9, 2)     NOT NULL,
    FECHA_STATUS      DATE             NOT NULL,
    SUCURSAL_ID       NUMBER(10, 0)    NOT NULL,
    STATUS_AUTO_ID    NUMBER(2, 0)     NOT NULL,
    MODELO_ID         NUMBER(10, 0)    NOT NULL,
    CONSTRAINT AUTO_PK PRIMARY KEY (AUTO_ID), 
    CONSTRAINT RefMODELO_R_CAEH_S215 FOREIGN KEY (MODELO_ID)
    REFERENCES MODELO_R_CAEH_S2(MODELO_ID),
    CONSTRAINT auto_agencia_id_fk FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F3_CAEH_S2(SUCURSAL_ID),
    CONSTRAINT auto_status_id_fk FOREIGN KEY (STATUS_AUTO_ID)
    REFERENCES STATUS_AUTO(STATUS_AUTO_ID)
)
;



-- 
-- TABLE: AUTO_CARGA_F2_CAEH_S2 
--

CREATE TABLE AUTO_CARGA_F2_CAEH_S2(
    AUTO_ID             NUMBER(10, 0)    NOT NULL,
    PESO_MAXIMO         NUMBER(10, 2)    NOT NULL,
    VOLUMEN             NUMBER(10, 2)    NOT NULL,
    TIPO_COMBUSTIBLE    CHAR(1)          NOT NULL,
    CONSTRAINT AUTO_CARGA_PK PRIMARY KEY (AUTO_ID), 
    CONSTRAINT RefAUTO_F3_CAEH_S22 FOREIGN KEY (AUTO_ID)
    REFERENCES AUTO_F3_CAEH_S2(AUTO_ID)
)
;



-- 
-- TABLE: AUTO_PARTICULAR_F2_CAEH_S2 
--

CREATE TABLE AUTO_PARTICULAR_F2_CAEH_S2(
    AUTO_ID          NUMBER(10, 0)    NOT NULL,
    NUM_CILINDROS    NUMBER(1, 0)     NOT NULL,
    NUM_PASAJEROS    NUMBER(2, 0)     NOT NULL,
    CLASE            CHAR(1)          NOT NULL,
    CONSTRAINT AUTO_PARTICULAR_PK PRIMARY KEY (AUTO_ID), 
    CONSTRAINT RefAUTO_F3_CAEH_S21 FOREIGN KEY (AUTO_ID)
    REFERENCES AUTO_F3_CAEH_S2(AUTO_ID)
)
;



-- 
-- TABLE: CLIENTE_F1_CAEH_S2 
--

CREATE TABLE CLIENTE_F1_CAEH_S2(
    CLIENTE_ID            NUMBER(10, 0)    NOT NULL,
    NOMBRE                VARCHAR2(40)     NOT NULL,
    AP_PATERNO            VARCHAR2(40)     NOT NULL,
    AP_MATERNO            VARCHAR2(40),
    NUM_IDENTIFICACION    VARCHAR2(18)     NOT NULL,
    EMAIL                 VARCHAR2(500)    NOT NULL,
    CONSTRAINT CLIENTE_PK PRIMARY KEY (CLIENTE_ID)
)
;



-- 
-- TABLE: PAGO_AUTO_F1_CAEH_S2 
--

CREATE TABLE PAGO_AUTO_F1_CAEH_S2(
    CLIENTE_ID     NUMBER(10, 0)    NOT NULL,
    AUTO_ID        NUMBER(10, 0)    NOT NULL,
    FECHA_PAGO     DATE             NOT NULL,
    IMPORTE        NUMBER(8, 2)     NOT NULL,
    RECIBO_PAGO    BLOB,
    CONSTRAINT PAGO_AUTO_PK PRIMARY KEY (CLIENTE_ID, AUTO_ID), 
    CONSTRAINT RefCLIENTE_F1_CAEH_S212 FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE_F1_CAEH_S2(CLIENTE_ID)
)
;



-- 
-- TABLE: TARJETA_CLIENTE_F2_CAEH_S2 
--

CREATE TABLE TARJETA_CLIENTE_F2_CAEH_S2(
    CLIENTE_ID     NUMBER(10, 0)    NOT NULL,
    ANIO_EXPIRA    VARCHAR2(2)      NOT NULL,
    MES_EXPIRA     VARCHAR2(2)      NOT NULL,
    TIPO           CHAR(1)          NOT NULL,
    CONSTRAINT TARJETA_CLIENTE_PK PRIMARY KEY (CLIENTE_ID), 
    CONSTRAINT tarjeta_cliente_id_fk FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE_F1_CAEH_S2(CLIENTE_ID)
)
;



