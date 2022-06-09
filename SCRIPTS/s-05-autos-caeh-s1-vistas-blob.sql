--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción:     Crea vistas para tablas con BLOB en nodo 1.

Prompt creando vistas para tablas con datos BLOB.
--AUTO
create or replace view AUTO as
select
q1.auto_id,
get_remote_foto_f1_by_id(q1.auto_id) as foto,
q1.anio,
q1.num_serie,
q1.tipo,
q1.precio,
q1.fecha_status,
q1.sucursal_id,
q1.status_auto_id,
q1.modelo_id
from
(
  select
  auto_id,
  anio,
  num_serie,
  tipo,
  precio,
  fecha_status,
  sucursal_id,
  status_auto_id,
  modelo_id
  from AUTO_F2
  union all
  select
  auto_id,
  anio,
  num_serie,
  tipo,
  precio,
  fecha_status,
  sucursal_id,
  status_auto_id,
  modelo_id
  from AUTO_F3
) q1;
--PAGO_AUTO
create or replace view PAGO_AUTO as
select
cliente_id,
auto_id,
fecha_pago,
importe,
get_remote_r_pago_f1_by_id(cliente_id, auto_id) as recibo_pago
from PAGO_AUTO_F1
union all
select
cliente_id,
auto_id,
fecha_pago,
importe,
get_remote_r_pago_f2_by_id(cliente_id, auto_id) as recibo_pago
from PAGO_AUTO_F2
union all
select
cliente_id,
auto_id,
fecha_pago,
importe,
get_remote_r_pago_f3_by_id(cliente_id, auto_id) as recibo_pago
from PAGO_AUTO_F3;