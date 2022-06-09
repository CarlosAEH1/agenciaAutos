--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea trigger para vista MODELO Replicada.

create or replace trigger t_dml_modelo
instead of insert or update or delete on MODELO
declare
v_count number;
begin
case
when inserting then
v_count:=0;
--Replica local
insert into MODELO_R1(modelo_id, clave, descripcion, activo, marca_id)
values(:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
v_count:=v_count+sql%rowcount;
--Replica 2
insert into MODELO_R2(modelo_id, clave, descripcion, activo, marca_id)
values(:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
v_count:=v_count+sql%rowcount;
--Replica 3
insert into MODELO_R3(modelo_id, clave, descripcion, activo, marca_id)
values(:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
v_count:=v_count+sql%rowcount;
--Replica 4
insert into MODELO_R4(modelo_id, clave, descripcion, activo, marca_id)
values(:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
v_count:=v_count+sql%rowcount;
if v_count<>4 then
raise_application_error
(
  -20040, 
  'No se inserto registro en tabla replicada MODELO: '||v_count
);
end if;
when deleting then
v_count:=0;
--Replica local
delete from MODELO_R1 where modelo_id=:old.modelo_id;
v_count:=v_count+sql%rowcount;
--Replica 2
delete from MODELO_R2 where modelo_id=:old.modelo_id;
v_count:=v_count+sql%rowcount;
--Replica 3
delete from MODELO_R3 where modelo_id=:old.modelo_id;
v_count:=v_count+sql%rowcount;
--Replica 4
delete from MODELO_R4 where modelo_id=:old.modelo_id;
v_count:=v_count+sql%rowcount;
if v_count<>4 then
raise_application_error
(
  -20040,
  'No se elimino registro en tabla replicada MODELO: '||v_count
);
end if;
when updating then
--Replica local
v_count:=0;
update MODELO_R1 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo,
marca_id=:new.marca_id
where modelo_id=:new.modelo_id;
v_count:=v_count+sql%rowcount;
--Replica 2
update MODELO_R2 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo,
marca_id=:new.marca_id
where modelo_id=:new.modelo_id;
v_count:=v_count+sql%rowcount;
--Replica 3
update MODELO_R3 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo,
marca_id=:new.marca_id
where modelo_id=:new.modelo_id;
v_count:=v_count+sql%rowcount;
--Replica 4
update MODELO_R4 set
clave=:new.clave,
descripcion =:new.descripcion, 
activo =:new.activo,
marca_id=:new.marca_id
where modelo_id=:new.modelo_id;
v_count:=v_count+sql%rowcount;
end case;
if v_count<>4 then
raise_application_error
(
  -20040,
  'No se actualizo registro en tabla replicada MODELO: '||v_count
);
end if;
end;
/
show errors