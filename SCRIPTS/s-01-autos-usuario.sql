--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  05/06/2022
--@Descripción:     Crea usuario y otorga permisos.

Prompt Eliminando usuario
declare
v_count number(1,0);
begin
select count(*) into v_count
from dba_users
where lower(username) ='autos_bdd';
if v_count > 0 then
execute immediate 'drop user autos_bdd cascade';
else
dbms_output.put_line('El usuario autos_bdd no existe');
end if;
end;
/

Prompt Creando usuario autos_bdd
create user autos_bdd identified by autos_bdd quota unlimited on users;
grant
create session,
create table,
create sequence,
create procedure,
create view,
create synonym,
create database link
to autos_bdd;