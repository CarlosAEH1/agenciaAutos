--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción:     Valida sinonimos.

Prompt validando sinonimos de PAIS
select
(select count(*) from PAIS_F1) as pais_f1,
(select count(*) from PAIS_F2) as pais_f2
from dual;
Prompt validando sinonimos de SUCURSAL
select
(select count(*) from SUCURSAL_F1) as sucursal_f1,
(select count(*) from SUCURSAL_F2) as sucursal_f2,
(select count(*) from SUCURSAL_F3) as sucursal_f3
from dual;
Prompt validando sinonimos de AUTO
select
(select count(*) from AUTO_F1) as auto_f1,
(select count(*) from AUTO_F2) as auto_f2,
(select count(*) from AUTO_F3) as auto_f3
from dual;
Prompt validando sinonimos de AUTO_PARTICULAR
select
(select count(*) from AUTO_PARTICULAR_F1) as auto_particular_f1,
(select count(*) from AUTO_PARTICULAR_F2) as auto_particular_f2
from dual;
Prompt validando sinonimos de AUTO_CARGA
select
(select count(*) from AUTO_CARGA_F1) as auto_carga_f1,
(select count(*) from AUTO_CARGA_F2) as auto_carga_f2
from dual;
Prompt validando sinonimos de HISTORICO_STATUS
select
(select count(*) from HISTORICO_STATUS_AUTO_F1) as historico_status_auto_f1,
(select count(*) from HISTORICO_STATUS_AUTO_F2) as historico_status_auto_f2
from dual;
Prompt validando sinonimos de CLIENTE
select
(select count(*) from CLIENTE_F1) as cliente_f1,
(select count(*) from CLIENTE_F2) as cliente_f2,
(select count(*) from CLIENTE_F3) as cliente_f3
from dual;
Prompt validando sinonimos de PAGO_AUTO
select
(select count(*) from PAGO_AUTO_F1) as pago_auto_f1,
(select count(*) from PAGO_AUTO_F2) as pago_auto_f2,
(select count(*) from PAGO_AUTO_F3) as pago_auto_f3
from dual;
Prompt validando sinonimos de TARJETA_CLIENTE
select
(select count(*) from TARJETA_CLIENTE_F1) as tarjeta_cliente_f1,
(select count(*) from TARJETA_CLIENTE_F2) as tarjeta_cliente_f2
from dual;
Prompt validando sinonimos de MARCA
select
(select count(*) from MARCA_R1) as marca_r1,
(select count(*) from MARCA_R2) as marca_r2,
(select count(*) from MARCA_R3) as marca_r3,
(select count(*) from MARCA_R4) as marca_r4
from dual;
Prompt validando sinonimos de MODELO
select
(select count(*) from MODELO_R1) as modelo_r1,
(select count(*) from MODELO_R2) as modelo_r2,
(select count(*) from MODELO_R3) as modelo_r3,
(select count(*) from MODELO_R4) as modelo_r4
from dual;