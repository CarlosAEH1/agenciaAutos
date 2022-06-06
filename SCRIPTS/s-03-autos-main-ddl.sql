--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  05/06/2022
--@Descripción:     Crea fragmentos en cada nodo.

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando fragmentos para caehbdd_s1
prompt =====================================
connect autos_bdd/autos_bdd@caehbdd_s1
@s-03-autos-caeh-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para caehbdd_s2
prompt =====================================
connect autos_bdd/autos_bdd@caehbdd_s2
@s-03-autos-caeh-s2-ddl.sql
prompt =====================================
prompt Creando fragmentos para iaehbdd_s1
prompt =====================================
connect autos_bdd/autos_bdd@iaehbdd_s1
@s-03-autos-iaeh-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para iaehbdd_s2
prompt =====================================
connect autos_bdd/autos_bdd@iaehbdd_s2
@s-03-autos-iaeh-s2-ddl.sql

Prompt Listo
exit