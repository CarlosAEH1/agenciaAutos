--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  06/06/2022
--@Descripción:     Crea fragmentos en nodo 1.

-- FRAGMENTO: MARCA_R_CAEH_S1 
CREATE TABLE MARCA_R_CAEH_S1
(
  MARCA_ID       NUMBER(3, 0)     NOT NULL,
  CLAVE          VARCHAR2(50)     NOT NULL,
  DESCRIPCION    VARCHAR2(500)    NOT NULL,
  ACTIVO         NUMBER(1, 0)     NOT NULL,
  CONSTRAINT MARCA_R_CAEH_S1_PK PRIMARY KEY(MARCA_ID)
);
-- FRAGMENTO: MODELO_R_CAEH_S1 
CREATE TABLE MODELO_R_CAEH_S1
(
  MODELO_ID      NUMBER(10, 0)    NOT NULL,
  CLAVE          VARCHAR2(50)     NOT NULL,
  DESCRIPCION    VARCHAR2(500)    NOT NULL,
  ACTIVO         NUMBER(1, 0),
  MARCA_ID       NUMBER(3, 0)     NOT NULL,
  CONSTRAINT MODELO_R_CAEH_S1_PK PRIMARY KEY(MODELO_ID),
  CONSTRAINT MODELO_MARCA_ID_S1_FK FOREIGN KEY(MARCA_ID)
  REFERENCES MARCA_R_CAEH_S1(MARCA_ID)
);
-- FRAGMENTO: PAIS_F1_CAEH_S1 
CREATE TABLE PAIS_F1_CAEH_S1
(
  PAIS_ID    NUMBER(4, 0)    NOT NULL,
  NOMBRE     VARCHAR2(40)    NOT NULL,
  CLAVE      VARCHAR2(4)     NOT NULL,
  REGION     VARCHAR2(3)     NOT NULL,
  CONSTRAINT PAIS_F1_CAEH_S1_PK PRIMARY KEY(PAIS_ID)
);
-- FRAGMENTO: SUCURSAL_F2_CAEH_S1 
CREATE TABLE SUCURSAL_F2_CAEH_S1
(
  SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
  NOMBRE               VARCHAR2(40)     NOT NULL,
  CLAVE                VARCHAR2(8)      NOT NULL,
  SUCURSAL_ANEXA_ID    NUMBER(10, 0),
  PAIS_ID              NUMBER(4, 0)     NOT NULL,
  CONSTRAINT SUCURSAL_F2_CAEH_S1_PK PRIMARY KEY(SUCURSAL_ID),
  CONSTRAINT SUCURSAL_PAIS_ID_S1_FK FOREIGN KEY(PAIS_ID)
  REFERENCES PAIS_F1_CAEH_S1(PAIS_ID)
);
-- FRAGMENTO: STATUS_AUTO 
CREATE TABLE STATUS_AUTO
(
  STATUS_AUTO_ID    NUMBER(2, 0)    NOT NULL,
  CLAVE             VARCHAR2(20)    NOT NULL,
  DESCRIPCION       VARCHAR2(40)    NOT NULL,
  CONSTRAINT STATUS_AUTO_PK PRIMARY KEY(STATUS_AUTO_ID)
);
-- FRAGMENTO: AUTO_F2_CAEH_S1 
CREATE TABLE AUTO_F2_CAEH_S1
(
  AUTO_ID           NUMBER(10, 0)    NOT NULL,
  ANIO              NUMBER(4, 0)     NOT NULL,
  NUM_SERIE         VARCHAR2(20)     NOT NULL,
  TIPO              CHAR(1)          NOT NULL,
  PRECIO            NUMBER(9, 2)     NOT NULL,
  FECHA_STATUS      DATE             NOT NULL,
  SUCURSAL_ID       NUMBER(10, 0)    NOT NULL,
  STATUS_AUTO_ID    NUMBER(2, 0)     NOT NULL,
  MODELO_ID         NUMBER(10, 0)    NOT NULL,
  CONSTRAINT AUTO_F2_CAEH_S1_PK PRIMARY KEY(AUTO_ID),
  CONSTRAINT AUTO_MODELO_ID_S1_FK FOREIGN KEY(MODELO_ID)
  REFERENCES MODELO_R_CAEH_S1(MODELO_ID),
  CONSTRAINT AUTO_AGENCIA_ID_S1_FK FOREIGN KEY(SUCURSAL_ID)
  REFERENCES SUCURSAL_F2_CAEH_S1(SUCURSAL_ID),
  CONSTRAINT AUTO_STATUS_ID_S1_FK FOREIGN KEY(STATUS_AUTO_ID)
  REFERENCES STATUS_AUTO(STATUS_AUTO_ID)
);
-- FRAGMENTO: AUTO_CARGA_F1_CAEH_S1 
CREATE TABLE AUTO_CARGA_F1_CAEH_S1
(
  AUTO_ID             NUMBER(10, 0)    NOT NULL,
  PESO_MAXIMO         NUMBER(10, 2)    NOT NULL,
  VOLUMEN             NUMBER(10, 2)    NOT NULL,
  TIPO_COMBUSTIBLE    CHAR(1)          NOT NULL,
  CONSTRAINT AUTO_CARGA_F1_CAEH_S1_PK PRIMARY KEY(AUTO_ID),
  CONSTRAINT AUTO_CARGA_AUTO_ID_S1_FK FOREIGN KEY(AUTO_ID)
  REFERENCES AUTO_F2_CAEH_S1(AUTO_ID)
);
-- FRAGMENTO: AUTO_PARTICULAR_F1_CAEH_S1 
CREATE TABLE AUTO_PARTICULAR_F1_CAEH_S1
(
  AUTO_ID          NUMBER(10, 0)    NOT NULL,
  NUM_CILINDROS    NUMBER(1, 0)     NOT NULL,
  NUM_PASAJEROS    NUMBER(2, 0)     NOT NULL,
  CLASE            CHAR(1)          NOT NULL,
  CONSTRAINT AUTO_PARTICULAR_F1_CAEH_S1_PK PRIMARY KEY(AUTO_ID),
  CONSTRAINT AUTO_PARTICULAR_AUTO_ID_S1_FK FOREIGN KEY(AUTO_ID)
  REFERENCES AUTO_F2_CAEH_S1(AUTO_ID)
);