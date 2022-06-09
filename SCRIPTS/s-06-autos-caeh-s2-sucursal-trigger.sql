--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       07/06/2022
--@Descripcion: Crea trigger para vista SUCURSAL en nodo 2.

create or replace trigger t_dml_sucursal
instead of insert or update or delete on SUCURSAL
declare
v_count number;
begin
case
when inserting then
if substr(:new.clave, 1, 5)='00000' then
insert into SUCURSAL_F1
(
  sucursal_id,
  nombre,
  clave,
  sucursal_anexa_id,
  pais_id
)
values
(
  :new.sucursal_id,
  :new.nombre,
  :new.clave,
  :new.sucursal_anexa_id,
  :new.pais_id
);
else
--Verifica correspondencia local.
select count(*) into v_count
from PAIS_F2
where pais_id=:new.pais_id;
if v_count>0 then
--Insercion local.
insert into SUCURSAL_F3
(
  sucursal_id,
  nombre,
  clave,
  sucursal_anexa_id,
  pais_id
)
values
(
  :new.sucursal_id,
  :new.nombre,
  :new.clave,
  :new.sucursal_anexa_id,
  :new.pais_id
);
else
--Verifica correspondencia remota.
select count(*) into v_count
from PAIS_F1
where pais_id=:new.pais_id;
if v_count>0 then
--Insercion remota.
insert into SUCURSAL_F2
(
  sucursal_id,
  nombre,
  clave,
  sucursal_anexa_id,
  pais_id
)
values
(
  :new.sucursal_id,
  :new.nombre,
  :new.clave,
  :new.sucursal_anexa_id,
  :new.pais_id
);
else
raise_application_error
(
  -20020,
  'Valor incorrecto para pais_id: '||:new.pais_id||', no existe en tabla PAIS.'
);
end if;
end if;
end if;
when updating then
raise_application_error
(
  -20030,
  'Error, operación UPDATE no disponible en tabla SUCURSAL.'
);
when deleting then
if substr(:old.clave, 1, 5)='00000' then
delete from SUCURSAL_F1 where sucursal_id=:old.sucursal_id;
else
--Verifica correspondencia local.
select count(*) into v_count
from PAIS_F2
where pais_id =:old.pais_id;
if v_count>0 then delete from SUCURSAL_F3 where sucursal_id=:old.sucursal_id;
else
--Verifica correspondencia remota.
select count(*) into v_count
from PAIS_F1
where pais_id=:old.pais_id;
if v_count>0 then delete from SUCURSAL_F2 where sucursal_id=:old.sucursal_id;
else
raise_application_error
(
  -20020,
  'Valor incorrecto para pais_id: '||:old.pais_id||', no existe en tabla PAIS.'
);
end if;
end if;
end if;
end case;
end;
/