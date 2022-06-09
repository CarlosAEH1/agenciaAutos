--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  05/06/2022
--@Descripción:     Crea ligas en cada nodo.

clear screen
whenever sqlerror exit rollback;

Prompt ============================
Prompt Creando ligas en caehbdd_s1
Prompt ============================
connect autos_bdd/autos_bdd@caehbdd_s1
--PDB local
create database link caehbdd_s2.fi.unam using 'CAEHBDD_S2';
--PDB remotas
create database link iaehbdd_s1.fi.unam using 'IAEHBDD_S1';
Create database link iaehbdd_s2.fi.unam using 'IAEHBDD_S2';
Prompt ============================
Prompt Creando ligas en caehbdd_s2
Prompt ============================
connect autos_bdd/autos_bdd@caehbdd_s2
--PDB local
create database link caehbdd_s1.fi.unam using 'CAEHBDD_S1';
--PDB remotas
create database link iaehbdd_s1.fi.unam using 'IAEHBDD_S1';
Create database link iaehbdd_s2.fi.unam using 'IAEHBDD_S2';
Prompt ============================
Prompt Creando ligas en iaehbdd_s1
Prompt ============================
connect autos_bdd/autos_bdd@iaehbdd_s1
--PDB local
create database link iaehbdd_s2.fi.unam using 'IAEHBDD_S2';
--PDB remotas
create database link caehbdd_s1.fi.unam using 'CAEHBDD_S1';
Create database link caehbdd_s2.fi.unam using 'CAEHBDD_S2';
Prompt ============================
Prompt Creando ligas en iaehbdd_s2
Prompt ============================
connect autos_bdd/autos_bdd@iaehbdd_s2
--PDB local
create database link iaehbdd_s1.fi.unam using 'IAEHBDD_S1';
--PDB remotas
create database link caehbdd_s1.fi.unam using 'CAEHBDD_S1';
Create database link caehbdd_s2.fi.unam using 'CAEHBDD_S2';

Prompt Listo!
disconnect