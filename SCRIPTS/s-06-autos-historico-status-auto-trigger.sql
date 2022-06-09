--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista HISTORICO_STATUS.

create or replace trigger t_dml_historico_status_auto
instead of insert or update or delete on HISTORICO_STATUS_AUTO
declare
begin
case
when inserting then
if :new.fecha_status<to_date('2011-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') then
insert into HISTORICO_STATUS_AUTO_F1
(
  historico_status_id,
  fecha_status,
  status_auto_id,
  auto_id
)
values
(
  :new.historico_status_id,
  :new.fecha_status,
  :new.status_auto_id,
  :new.auto_id
);
elsif :new.fecha_status>=to_date
(
  '2011-01-01 00:00:00',
  'YYYY-MM-DD HH24:MI:SS'
) then
insert into HISTORICO_STATUS_AUTO_F2
(
  historico_status_id,
  fecha_status,
  status_auto_id,
  auto_id
)
values
(
  :new.historico_status_id,
  :new.fecha_status,
  :new.status_auto_id,
  :new.auto_id
);
else
raise_application_error
(
  -20010,
  'Valor incorrecto para fecha_status: '||:new.fecha_status||'.'
);
end if;
when updating then raise_application_error
(
  -20030,
  'Error, operación UPDATE aún no tiene soporte.'
);
when deleting then
if :old.fecha_status<to_date('2011-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') then
delete from HISTORICO_STATUS_AUTO_F1
where historico_status_id=:old.historico_status_id;
elsif :old.fecha_status>=to_date
(
  '2011-01-01 00:00:00',
  'YYYY-MM-DD HH24:MI:SS'
) then
delete from HISTORICO_STATUS_AUTO_F2
where historico_status_id=:old.historico_status_id;
else
raise_application_error
(
  -20010,
  'Valor incorrecto para fecha_status: '||:old.fecha_status||'.'
);
end if;
end case;
end;
/