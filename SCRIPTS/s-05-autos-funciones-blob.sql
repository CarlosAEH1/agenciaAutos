--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción:     Crea funciones para acceso BLOB.

Prompt CReando funcion con estrategis 2 para AUTO_F1
create or replace function get_remote_foto_f1_by_id(p_auto_id in number)
return blob is pragma autonomous_transaction;
v_temp_foto blob;
begin
--Asegura que no haya registros en la tabla temporal
delete from TS_AUTO_F1;
--Inserta datos obtenidos de fragmento remoto a la tabla temporal.
insert into TS_AUTO_F1(auto_id, foto)
select auto_id, foto
from AUTO_F1
where auto_id=p_auto_id;
--Consulta registro de tabla temporal y lo regresa como BLOB.
select foto into v_temp_foto
from TS_AUTO_F1
where auto_id=p_auto_id;
--Elimina registros de la tabla temporal una vez que han sido obtenidos.
delete from TS_AUTO_F1;
commit;
return v_temp_foto;
exception
when others then
rollback;
raise;
end;
/
show errors

Prompt Creando funciones con estrategia 2 para PAGO_AUTO_F1
create or replace function get_remote_r_pago_f1_by_id
(
  p_cliente_id in number,
  p_auto_id in number
) return blob is pragma autonomous_transaction;
v_temp_pdf blob;
begin
--Asegura que no haya registros en la tabla temporal
delete from TS_PAGO_AUTO_F1;
--Inserta datos obtenidos de fragmento remoto a la tabla temporal.
insert into TS_PAGO_AUTO_F1(cliente_id, auto_id, recibo_pago)
select cliente_id, auto_id, recibo_pago
from PAGO_AUTO_F1
where cliente_id=p_cliente_id and auto_id=p_auto_id;
--Consulta registro de tabla temporal y lo regresa como BLOB.
select recibo_pago into v_temp_pdf
from TS_PAGO_AUTO_F1
where cliente_id=p_cliente_id and auto_id=p_auto_id;
--Elimina registros de la tabla temporal una vez que han sido obtenidos.
delete from TS_PAGO_AUTO_F1;
commit;
return v_temp_pdf;
exception
when others then
rollback;
raise;
end;
/
show errors

Prompt Creando funciones con estrategia 2 para PAGO_AUTO_F2
create or replace function get_remote_r_pago_f2_by_id
(
  p_cliente_id in number,
  p_auto_id in number
) return blob is pragma autonomous_transaction;
v_temp_pdf blob;
begin
--Asegura que no haya registros en la tabla temporal
delete from TS_PAGO_AUTO_F2;
--Inserta datos obtenidos de fragmento remoto a la tabla temporal.
insert into TS_PAGO_AUTO_F2(cliente_id, auto_id, recibo_pago)
select cliente_id, auto_id, recibo_pago
from PAGO_AUTO_F2
where cliente_id=p_cliente_id and auto_id=p_auto_id;
--Consulta registro de tabla temporal y lo regresa como BLOB.
select recibo_pago into v_temp_pdf
from TS_PAGO_AUTO_F2
where cliente_id=p_cliente_id and auto_id=p_auto_id;
--Elimina registros de la tabla temporal una vez que han sido obtenidos.
delete from TS_PAGO_AUTO_F2;
commit;
return v_temp_pdf;
exception
when others then
rollback;
raise;
end;
/
show errors

Prompt Creando funciones con estrategia 2 para PAGO_AUTO_F3
create or replace function get_remote_r_pago_f3_by_id
(
  p_cliente_id in number,
  p_auto_id in number
) return blob is pragma autonomous_transaction;
v_temp_pdf blob;
begin
--Asegura que no haya registros en la tabla temporal
delete from TS_PAGO_AUTO_F3;
--Inserta datos obtenidos de fragmento remoto a la tabla temporal.
insert into TS_PAGO_AUTO_F3(cliente_id, auto_id, recibo_pago)
select cliente_id, auto_id, recibo_pago
from PAGO_AUTO_F3
where cliente_id=p_cliente_id and auto_id=p_auto_id;
--Consulta registro de tabla temporal y lo regresa como BLOB.
select recibo_pago into v_temp_pdf
from TS_PAGO_AUTO_F3
where cliente_id=p_cliente_id and auto_id=p_auto_id;
--Elimina registros de la tabla temporal una vez que han sido obtenidos.
delete from TS_PAGO_AUTO_F3;
commit;
return v_temp_pdf;
exception
when others then
rollback;
raise;
end;
/
show errors