--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción:     Crea tablas temporales para manejo BLOB.

Prompt Eliminando tablas temporales.
declare
cursor cur_tablas is
select table_name
from user_tables
where table_name in('TS_AUTO_F1', 'TI_AUTO_F1')
or table_name in
(
  'TS_PAGO_AUTO_F1',
  'TS_PAGO_AUTO_F2',
  'TS_PAGO_AUTO_F3',
  'TI_PAGO_AUTO_F1',
  'TI_PAGO_AUTO_F2',
  'TI_PAGO_AUTO_F3'
);
begin
for r in cur_tablas loop
execute immediate 'drop table '||r.table_name;
end loop;
end;
/

Prompt Creando tablas temporales para AUTO
create global temporary table TS_AUTO_F1
(
  auto_id number(10,0) constraint ts_auto_f1_pk primary key,
  foto blob not null
) on commit preserve rows;
create global temporary table TI_AUTO_F1
(
  auto_id number(10,0) constraint ti_auto_f1_pk primary key,
  foto blob not null
) on commit preserve rows;

Prompt Creando tablas temporales para PAGO_AUTO_F1
create global temporary table TS_PAGO_AUTO_F1
(
  cliente_id number(10,0),
  auto_id number(10,0),
  recibo_pago blob not null,
  constraint ts_pago_auto_f1_pk primary key (cliente_id, auto_id)
) on commit preserve rows;
create global temporary table TI_PAGO_AUTO_F1
(
  cliente_id number(10,0),
  auto_id number(10,0),
  fecha_pago date not null,
  importe number(8,2) not null,
  recibo_pago blob not null,
  constraint ti_pago_auto_f1_pk primary key(cliente_id, auto_id)
) on commit preserve rows;

Prompt Creando tablas temporales para PAGO_AUTO_F2
create global temporary table TS_PAGO_AUTO_F2
(
  cliente_id number(10,0),
  auto_id number(10,0),
  recibo_pago blob not null,
  constraint ts_pago_auto_f2_pk primary key (cliente_id, auto_id)
) on commit preserve rows;
create global temporary table TI_PAGO_AUTO_F2
(
  cliente_id number(10,0),
  auto_id number(10,0),
  fecha_pago date not null,
  importe number(8,2) not null,
  recibo_pago blob not null,
  constraint ti_pago_auto_f2_pk primary key(cliente_id, auto_id)
) on commit preserve rows;

Prompt Creando tablas temporales para PAGO_AUTO_F3
create global temporary table TS_PAGO_AUTO_F3
(
  cliente_id number(10,0),
  auto_id number(10,0),
  recibo_pago blob not null,
  constraint ts_pago_auto_f3_pk primary key (cliente_id, auto_id)
) on commit preserve rows;
create global temporary table TI_PAGO_AUTO_F3
(
  cliente_id number(10,0),
  auto_id number(10,0),
  fecha_pago date not null,
  importe number(8,2) not null,
  recibo_pago blob not null,
  constraint ti_pago_auto_f3_pk primary key(cliente_id, auto_id)
) on commit preserve rows;