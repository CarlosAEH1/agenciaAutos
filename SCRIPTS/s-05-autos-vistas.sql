--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción:     Crea vistas para tablas sin columnas BLOB.

--PAIS
create or replace view PAIS as
select pais_id, nombre, clave, region from PAIS_F1
union all
select pais_id, nombre, clave, region from PAIS_F2;
--SUCURSAL
create or replace view SUCURSAL as
select sucursal_id, nombre, clave, sucursal_anexa_id, pais_id from SUCURSAL_F1
union all
select sucursal_id, nombre, clave, sucursal_anexa_id, pais_id from SUCURSAL_F2
union all
select sucursal_id, nombre, clave, sucursal_anexa_id, pais_id from SUCURSAL_F3;
--AUTO_PARTICULAR
create or replace view AUTO_PARTICULAR as
select auto_id, num_cilindros, num_pasajeros, clase from AUTO_PARTICULAR_F1
union all
select auto_id, num_cilindros, num_pasajeros, clase from AUTO_PARTICULAR_F2;
--AUTO_CARGA
create or replace view AUTO_CARGA as
select auto_id, peso_maximo, volumen, tipo_combustible from AUTO_CARGA_F1
union all
select auto_id, peso_maximo, volumen, tipo_combustible from AUTO_CARGA_F2;
--HISTORICO_STATUS_AUTO
create or replace view HISTORICO_STATUS_AUTO as
select historico_status_id, fecha_status, status_auto_id, auto_id
from HISTORICO_STATUS_AUTO_F1
union all
select historico_status_id, fecha_status, status_auto_id, auto_id
from HISTORICO_STATUS_AUTO_F2;
--CLIENTE
create or replace view CLIENTE as
select cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email
from CLIENTE_F1
union all
select cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email
from CLIENTE_F2
union all
select cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email
from CLIENTE_F3;
--TARJETA_CLIENTE
create or replace view TARJETA_CLIENTE as
select
t1.cliente_id,
num_tarjeta,
anio_expira,
mes_expira,
codigo_seguridad,
tipo
from TARJETA_CLIENTE_F1 t1
join TARJETA_CLIENTE_F2 t2 on t2.cliente_id=t1.cliente_id;
--MARCA
create or replace view MARCA as
select marca_id, clave, descripcion, activo from MARCA_R1;
--MODELO
create or replace view MODELO as
select modelo_id, clave, descripcion, activo, marca_id from MODELO_R1;