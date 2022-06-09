--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción:     Crea fragmentos en nodo 1.

--PAIS
create or replace synonym PAIS_F1 for PAIS_F1_CAEH_S1;
create or replace synonym PAIS_F2 for PAIS_F2_CAEH_S2@caehbdd_s2;
--SUCURSAL
create or replace synonym SUCURSAL_F1 for SUCURSAL_F1_IAEH_S1@iaehbdd_s1;
create or replace synonym SUCURSAL_F2 for SUCURSAL_F2_CAEH_S1;
create or replace synonym SUCURSAL_F3 for SUCURSAL_F3_CAEH_S2@caehbdd_s2;
--AUTO
create or replace synonym AUTO_F1 for AUTO_F1_IAEH_S2@iaehbdd_s2;
create or replace synonym AUTO_F2 for AUTO_F2_CAEH_S1;
create or replace synonym AUTO_F3 for AUTO_F3_CAEH_S2@caehbdd_s2;
--AUTO_PARTICULAR
create or replace synonym AUTO_PARTICULAR_F1 for AUTO_PARTICULAR_F1_CAEH_S1;
create or replace synonym AUTO_PARTICULAR_F2
for AUTO_PARTICULAR_F2_CAEH_S2@caehbdd_s2;
--AUTO_CARGA
create or replace synonym AUTO_CARGA_F1 for AUTO_CARGA_F1_CAEH_S1;
create or replace synonym AUTO_CARGA_F2 for AUTO_CARGA_F2_CAEH_S2@caehbdd_s2;
--HISTORICO_STATUS_AUTO
create or replace synonym HISTORICO_STATUS_AUTO_F1
for HISTORICO_STATUS_F1_IAEH_S2@iaehbdd_s2;
create or replace synonym HISTORICO_STATUS_AUTO_F2
for HISTORICO_STATUS_F2_IAEH_S1@iaehbdd_s1;
--CLIENTE
create or replace synonym CLIENTE_F1 for CLIENTE_F1_CAEH_S2@caehbdd_s2;
create or replace synonym CLIENTE_F2 for CLIENTE_F2_IAEH_S1@iaehbdd_s1;
create or replace synonym CLIENTE_F3 for CLIENTE_F3_IAEH_S2@iaehbdd_s2;
--PAGO_AUTO
create or replace synonym PAGO_AUTO_F1 for PAGO_AUTO_F1_CAEH_S2@caehbdd_s2;
create or replace synonym PAGO_AUTO_F2 for PAGO_AUTO_F2_IAEH_S1@iaehbdd_s1;
create or replace synonym PAGO_AUTO_F3 for PAGO_AUTO_F3_IAEH_S2@iaehbdd_s2;
--TARJETA_CLIENTE
create or replace synonym TARJETA_CLIENTE_F1
for TARJETA_CLIENTE_F1_IAEH_S1@iaehbdd_s1;
create or replace synonym TARJETA_CLIENTE_F2
for TARJETA_CLIENTE_F2_CAEH_S2@caehbdd_s2;
--MARCA
create or replace synonym MARCA_R1 for MARCA_R_CAEH_S1;
create or replace synonym MARCA_R2 for MARCA_R_CAEH_S2@caehbdd_s2;
create or replace synonym MARCA_R3 for MARCA_R_IAEH_S1@iaehbdd_s1;
create or replace synonym MARCA_R4 for MARCA_R_IAEH_S2@iaehbdd_s2;
--MODELO
create or replace synonym MODELO_R1 for MODELO_R_CAEH_S1;
create or replace synonym MODELO_R2 for MODELO_R_CAEH_S2@caehbdd_s2;
create or replace synonym MODELO_R3 for MODELO_R_IAEH_S1@iaehbdd_s1;
create or replace synonym MODELO_R4 for MODELO_R_IAEH_S2@iaehbdd_s2;