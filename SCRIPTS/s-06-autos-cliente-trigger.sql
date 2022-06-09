--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista CLIENTE.

create or replace trigger t_dml_cliente
instead of insert or update or delete on CLIENTE
declare
begin
case
when inserting then
if substr(:new.ap_paterno, 1, 1) between 'A' and 'I'
or substr(:new.ap_paterno, 1, 1) between 'a' and 'i' then
insert into CLIENTE_F1
(
  cliente_id,
  nombre,
  ap_paterno,
  ap_materno,
  num_identificacion,
  email
)
values
(
  :new.cliente_id,
  :new.nombre,
  :new.ap_paterno,
  :new.ap_materno,
  :new.num_identificacion,
  :new.email
);
elsif substr(:new.ap_paterno, 1, 1) between 'J' and 'Q'
or substr(:new.ap_paterno, 1, 1) between 'j' and 'q' then
insert into CLIENTE_F2
(
  cliente_id,
  nombre,
  ap_paterno,
  ap_materno,
  num_identificacion,
  email
)
values
(
  :new.cliente_id,
  :new.nombre,
  :new.ap_paterno,
  :new.ap_materno,
  :new.num_identificacion,
  :new.email
);
elsif substr(:new.ap_paterno, 1, 1) between 'R' and 'Z'
or substr(:new.ap_paterno, 1, 1) between 'r' and 'z' then
insert into CLIENTE_F3
(
  cliente_id,
  nombre,
  ap_paterno,
  ap_materno,
  num_identificacion,
  email
)
values
(
  :new.cliente_id,
  :new.nombre,
  :new.ap_paterno,
  :new.ap_materno,
  :new.num_identificacion,
  :new.email
);
else
raise_application_error
(
  -20010,
  'Valor incorrecto para ap_paterno: '||:new.ap_paterno||
  ', debe iniciar entre A y Z.'
);
end if;
when updating then raise_application_error
(
  -20030,
  'Error, operación UPDATE aún no tiene soporte.'
);
when deleting then
if substr(:old.ap_paterno, 1, 1) between 'A' and 'I'
or substr(:old.ap_paterno, 1, 1) between 'a' and 'i' then
delete from CLIENTE_F1 where cliente_id=:old.cliente_id;
elsif substr(:old.ap_paterno, 1, 1) between 'J' and 'Q'
or substr(:old.ap_paterno, 1, 1) between 'j' and 'q' then
delete from CLIENTE_F2 where cliente_id=:old.cliente_id;
elsif substr(:old.ap_paterno, 1, 1) between 'R' and 'Z'
or substr(:old.ap_paterno, 1, 1) between 'r' and 'z' then
delete from CLIENTE_F3 where cliente_id=:old.cliente_id;
else
raise_application_error
(
  -20010,
  'Valor incorrecto para ap_paterno: '||:old.ap_paterno||
  ', debe iniciar entre A y Z.'
);
end if;
end case;
end;
/