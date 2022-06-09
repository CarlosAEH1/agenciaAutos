--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista MARCA Replicada.

create or replace trigger t_dml_marca
instead of insert or update or delete on MARCA
declare
v_count number;
begin
case
when inserting then
v_count:=0;
--Replica local
insert into MARCA_R1(marca_id, clave, descripcion, activo)
values(:new.marca_id, :new.clave, :new.descripcion, :new.activo);
v_count:=v_count+sql%rowcount;
--Replica 2
insert into MARCA_R2(marca_id, clave, descripcion, activo)
values(:new.marca_id, :new.clave, :new.descripcion, :new.activo);
v_count:=v_count+sql%rowcount;
--Replica 3
insert into MARCA_R3(marca_id, clave, descripcion, activo)
values(:new.marca_id, :new.clave, :new.descripcion, :new.activo);
v_count:=v_count+sql%rowcount;
--Replica 4
insert into MARCA_R4(marca_id, clave, descripcion, activo)
values(:new.marca_id, :new.clave, :new.descripcion, :new.activo);
v_count:=v_count+sql%rowcount;
if v_count<>4 then
raise_application_error
(
  -20040, 
  'No se inserto registro en tabla replicada MARCA: '||v_count
);
end if;
when deleting then
v_count:=0;
--Replica local
delete from MARCA_R1 where marca_id=:old.marca_id;
v_count:=v_count+sql%rowcount;
--Replica 2
delete from MARCA_R2 where marca_id=:old.marca_id;
v_count:=v_count+sql%rowcount;
--Replica 3
delete from MARCA_R3 where marca_id=:old.marca_id;
v_count:=v_count+sql%rowcount;
--Replica 4
delete from MARCA_R4 where marca_id=:old.marca_id;
v_count:=v_count+sql%rowcount;
if v_count<>4 then
raise_application_error
(
  -20040,
  'No se elimino registro en tabla replicada MARCA: '||v_count
);
end if;
when updating then
--Replica local
v_count:=0;
update MARCA_R1 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo
where marca_id=:new.marca_id;
v_count:=v_count+sql%rowcount;
--Replica 2
update MARCA_R2 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo
where marca_id=:new.marca_id;
v_count:=v_count+sql%rowcount;
--Replica 3
update MARCA_R3 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo
where marca_id=:new.marca_id;
v_count:=v_count+sql%rowcount;
--Replica 4
update MARCA_R4 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo
where marca_id=:new.marca_id;
v_count:=v_count+sql%rowcount;
end case;
if v_count<>4 then
raise_application_error
(
  -20040,
  'No se actualizo registro en tabla replicada MARCA: '||v_count
);
end if;
end;
/
show errors