--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista AUTO_PARTICULAR en nodo 1.

create or replace trigger t_dml_auto_particular
instead of insert or update or delete on AUTO_PARTICULAR
declare
v_count number;
begin
case
when inserting then
--Verifica correspondencia local
select count(*) into v_count
from AUTO_F2
where auto_id=:new.auto_id;
if v_count>0 then
--Insercion local
insert into AUTO_PARTICULAR_F1
(
  auto_id,
  num_cilindros,
  num_pasajeros,
  clase
)
values
(
  :new.auto_id,
  :new.num_cilindros,
  :new.num_pasajeros,
  :new.clase
);
else
--Verifica correspondencia remota
select count(*) into v_count
from AUTO_F3
where auto_id=:new.auto_id;
if v_count>0 then
--Insercion remota
insert into AUTO_PARTICULAR_F2
(
  auto_id,
  num_cilindros,
  num_pasajeros,
  clase
)
values
(
  :new.auto_id,
  :new.num_cilindros,
  :new.num_pasajeros,
  :new.clase
);
else
raise_application_error
(
  -20020,
  'Valor incorrecto para auto_id: '||:new.auto_id||
  ', no existe en tabla AUTO.'
);
end if;
end if;
when updating then raise_application_error
(
  -20030,
  'Error, operación UPDATE aún no tiene soporte.'
);
when deleting then
select count(*) into v_count
from AUTO_F2
where auto_id=:old.auto_id;
if v_count>0 then delete from AUTO_PARTICULAR_F1 where auto_id=:old.auto_id;
else
select count(*) into v_count
from AUTO_F3
where auto_id=:old.auto_id;
if v_count>0 then delete from AUTO_PARTICULAR_F2 where auto_id=:old.auto_id;
else
raise_application_error
(
  -20020,
  'Valor incorrecto para auto_id: '||:old.auto_id||
  ', no existe en tabla AUTO.'
);
end if;
end if;
end case;
end;
/