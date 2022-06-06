--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  05/06/2022
--@Descripción:     Crea usuario en cada nodo.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

Prompt Creando usuarios.
accept syspass char Prompt 'Proporcione el password de sys: ' hide
Prompt =====================================
Prompt Creando usuario en caehbdd_s1
Prompt =====================================
connect sys/&&syspass@caehbdd_s1 as sysdba
@s-01-autos-usuario.sql
Prompt =====================================
Prompt Creando usuario en caehbdd_s2
Prompt =====================================
connect sys/&&syspass@caehbdd_s2 as sysdba
@s-01-autos-usuario.sql
Prompt =====================================
Prompt Creando usuario en iaehbdd_s1
Prompt =====================================
connect sys/&&syspass@iaehbdd_s1 as sysdba
@s-01-autos-usuario.sql
Prompt =====================================
Prompt Creando usuario en iaehbdd_s2
Prompt =====================================
connect sys/&&syspass@iaehbdd_s2 as sysdba
@s-01-autos-usuario.sql

Prompt Listo
exit