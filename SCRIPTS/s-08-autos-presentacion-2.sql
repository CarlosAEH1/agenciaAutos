--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       09/06/2022
--@Descripcion: Carga inicial manual de datos en cada nodo.

clear screen
whenever sqlerror exit rollback;

Prompt ======================================
Prompt Cargando catalogos replicados en caehbdd_s1
Prompt ======================================
connect autos_bdd/autos_bdd@caehbdd_s1
delete from status_auto;
@carga-inicial/status_auto.sql
Prompt ======================================
Prompt Cargando catalogos replicados en caehbdd_s2
Prompt ======================================
connect autos_bdd/autos_bdd@caehbdd_s2
delete from status_auto;
@carga-inicial/status_auto.sql
Prompt ======================================
Prompt Cargando catalogos replicados en iaehbdd_s1
Prompt ======================================
connect autos_bdd/autos_bdd@iaehbdd_s1
delete from status_auto;
@carga-inicial/status_auto.sql
Prompt ======================================
Prompt Cargando catalogos replicados en iaehbdd_s2
Prompt ======================================
connect autos_bdd/autos_bdd@iaehbdd_s2
delete from status_auto;
@carga-inicial/status_auto.sql

Prompt Haciendo commit de todos los datos
commit;

Prompt Listo !
exit