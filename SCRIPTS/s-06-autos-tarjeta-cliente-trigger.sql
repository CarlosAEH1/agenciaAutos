--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista TARJETA_CLIENTE.

create or replace trigger t_dml_tarjeta_cliente
instead of insert or update or delete on TARJETA_CLIENTE
declare
v_count_1 number;
v_count_2 number;
begin
case
when inserting then
insert into TARJETA_CLIENTE_F1
(
  cliente_id,
  num_tarjeta,
  codigo_seguridad
)
values
(
  :new.cliente_id,
  :new.num_tarjeta,
  :new.codigo_seguridad
);
insert into TARJETA_CLIENTE_F2
(
  cliente_id,
  anio_expira,
  mes_expira,
  tipo
)
values
(
  :new.cliente_id,
  :new.anio_expira,
  :new.mes_expira,
  :new.tipo
);
when updating then
raise_application_error
(
  -20030,
  'Error, operación UPDATE aún no tiene soporte.'
);
when deleting then
delete from TARJETA_CLIENTE_F1 where cliente_id=:old.cliente_id;
delete from TARJETA_CLIENTE_F2 where cliente_id=:old.cliente_id;
end case;
end;
/