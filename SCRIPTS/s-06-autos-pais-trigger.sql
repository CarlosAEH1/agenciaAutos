--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       07/06/2022
--@Descripcion: Crea trigger para vista PAIS.

create or replace trigger t_dml_pais
instead of insert or update or delete on PAIS
declare
begin
case
when inserting then
if :new.region='AME' then
insert into PAIS_F1(pais_id, nombre, clave, region)
values(:new.pais_id, :new.nombre, :new.clave, :new.region);
elsif :new.region='EUR' then
insert into PAIS_F2(pais_id, nombre, clave, region)
values(:new.pais_id, :new.nombre, :new.clave, :new.region);
else
raise_application_error
(
  -20010,
  'Valor incorrecto para region: '||:new.region||', sólo se permite AME o EUR.'
);
end if;
when updating then
raise_application_error
(
  -20030,
  'Error, operación UPDATE no disponible en tabla PAIS.'
);
when deleting then
if :old.region='AME' then delete from PAIS_F1 where pais_id=:old.pais_id;
elsif :old.region='EUR' then delete from PAIS_F2 where pais_id=:old.pais_id;
else
raise_application_error
(
  -20010,
  'Valor incorrecto para region: '||:old.region||', sólo se permite AME o EUR.'
);
end if;
end case;
end;
/