--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista AUTO en nodo 4.

create or replace trigger t_dml_auto
instead of insert or update or delete on AUTO
declare
v_count number;
begin
case
when inserting then
insert into AUTO_F1
(
  auto_id,
  foto
)
values
(
  :new.auto_id,
  :new.foto
);
select count(*) into v_count
from SUCURSAL_F2
where sucursal_id=:new.sucursal_id;
if v_count>0 then
--Insercion local
insert into AUTO_F2
(
  auto_id,
  anio,
  num_serie,
  tipo,
  precio,
  fecha_status,
  sucursal_id,
  status_auto_id,
  modelo_id
)
values
(
  :new.auto_id,
  :new.anio,
  :new.num_serie,
  :new.tipo,
  :new.precio,
  :new.fecha_status,
  :new.sucursal_id,
  :new.status_auto_id,
  :new.modelo_id
);
else
select count(*) into v_count
from SUCURSAL_F3
where sucursal_id=:new.sucursal_id;
if v_count>0 then
insert into AUTO_F3
(
  auto_id,
  anio,
  num_serie,
  tipo,
  precio,
  fecha_status,
  sucursal_id,
  status_auto_id,
  modelo_id
)
values
(
  :new.auto_id,
  :new.anio,
  :new.num_serie,
  :new.tipo,
  :new.precio,
  :new.fecha_status,
  :new.sucursal_id,
  :new.status_auto_id,
  :new.modelo_id
);
else
raise_application_error
(
  -20020,
  'Valor incorrecto para sucursal_id: '||:new.sucursal_id||
  ', no existe en tabla SUCURSAL.'
);
end if;
end if;
when updating then raise_application_error
(
  -20030,
  'Error, operación UPDATE aún no tiene soporte.'
);
when deleting then
delete from AUTO_F1 where auto_id=:old.auto_id;
select count(*) into v_count
from SUCURSAL_F2
where sucursal_id=:old.sucursal_id;
if v_count>0 then delete from AUTO_F2 where auto_id=:old.auto_id;
else
select count(*) into v_count
from SUCURSAL_F3
where sucursal_id=:old.sucursal_id;
if v_count>0 then delete from AUTO_F3 where auto_id=:old.auto_id;
else
raise_application_error
(
  -20020,
  'Valor incorrecto para sucursal_id: '||:old.sucursal_id||
  ', no existe en tabla SUCURSAL.'
);
end if;
end if;
end case;
end;
/