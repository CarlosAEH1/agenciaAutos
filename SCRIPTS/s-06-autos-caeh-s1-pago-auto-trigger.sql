--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista PAGO_AUTO en nodo 2.

create or replace trigger t_dml_pago_auto
instead of insert or update or delete on PAGO_AUTO
declare
v_count number;
begin
case
when inserting then
--Verifica correspondencia local.
select count(*) into v_count
from CLIENTE_F1
where cliente_id=:new.cliente_id;
if v_count>0 then
--Insercion de BLOB remoto mediante tabla temporal
insert into TI_PAGO_AUTO_F1
(
  cliente_id,
  auto_id,
  fecha_pago,
  importe,
  recibo_pago
)
values
(
  :new.cliente_id,
  :new.auto_id,
  :new.fecha_pago,
  :new.importe,
  :new.recibo_pago
);
insert into PAGO_AUTO_F1
select * from TI_PAGO_AUTO_F1
where cliente_id=:new.cliente_id and auto_id=:new.auto_id;
delete from TI_PAGO_AUTO_F1
where cliente_id=:new.cliente_id and auto_id=:new.auto_id;
else
--Verifica correspondencia remota
select count(*) into v_count
from CLIENTE_F2
where cliente_id=:new.cliente_id;
if v_count>0 then
--Insercion de BLOB remoto mediante tabla temporal
insert into TI_PAGO_AUTO_F2
(
  cliente_id,
  auto_id,
  fecha_pago,
  importe,
  recibo_pago
)
values
(
  :new.cliente_id,
  :new.auto_id,
  :new.fecha_pago,
  :new.importe,
  :new.recibo_pago
);
insert into PAGO_AUTO_F2
select * from TI_PAGO_AUTO_F2
where cliente_id=:new.cliente_id and auto_id=:new.auto_id;
delete from TI_PAGO_AUTO_F2
where cliente_id=:new.cliente_id and auto_id=:new.auto_id;
else
select count(*) into v_count
from CLIENTE_F3
where cliente_id=:new.cliente_id;
if v_count>0 then
--Insercion de BLOB remoto mediante tabla temporal
insert into TI_PAGO_AUTO_F3
(
  cliente_id,
  auto_id,
  fecha_pago,
  importe,
  recibo_pago
)
values
(
  :new.cliente_id,
  :new.auto_id,
  :new.fecha_pago,
  :new.importe,
  :new.recibo_pago
);
insert into PAGO_AUTO_F3
select * from TI_PAGO_AUTO_F3
where cliente_id=:new.cliente_id and auto_id=:new.auto_id;
delete from TI_PAGO_AUTO_F3
where cliente_id=:new.cliente_id and auto_id=:new.auto_id;
else
raise_application_error
(
  -20020,
  'Valor incorrecto para cliente_id: '||:new.cliente_id||
  ', no existe en tabla CLIENTE.'
);
end if;
end if;
end if;
when updating then raise_application_error
(
  -20030,
  'Error, operación UPDATE aún no tiene soporte.'
);
when deleting then
--Verifica correspondencia local.
select count(*) into v_count from CLIENTE_F1 where cliente_id=:old.cliente_id;
if v_count>0 then delete from PAGO_AUTO_F1 where cliente_id=:old.cliente_id;
else
--Verifica correspondencia remota.
select count(*) into v_count from CLIENTE_F2 where cliente_id=:old.cliente_id;
if v_count>0 then delete from PAGO_AUTO_F2 where cliente_id=:old.cliente_id;
else
select count(*) into v_count from CLIENTE_F3 where cliente_id=:old.cliente_id;
if v_count>0 then delete from PAGO_AUTO_F3 where cliente_id=:old.cliente_id;
else
raise_application_error
(
  -20020,
  'Valor incorrecto para cliente_id: '||:old.cliente_id||
  ', no existe en tabla CLIENTE.'
);
end if;
end if;
end if;
end case;
end;
/