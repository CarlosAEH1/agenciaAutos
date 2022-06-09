--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción:     Crea sinonimos en cada nodo.

clear screen
whenever sqlerror exit rollback;

Prompt =====================================
Prompt Creando sinonimos para caehbdd_s1
Prompt =====================================
connect autos_bdd/autos_bdd@caehbdd_s1
@s-04-autos-caeh-s1-sinonimos.sql
@s-04-autos-valida-sinonimos.sql
Prompt =====================================
Prompt creando sinonimos para caehbdd_s2
Prompt =====================================
connect autos_bdd/autos_bdd@caehbdd_s2
@s-04-autos-caeh-s2-sinonimos.sql
@s-04-autos-valida-sinonimos.sql
Prompt =====================================
Prompt creando sinonimos para iaehbdd_s1
Prompt =====================================
connect autos_bdd/autos_bdd@iaehbdd_s1
@s-04-autos-iaeh-s1-sinonimos.sql
@s-04-autos-valida-sinonimos.sql
Prompt =====================================
Prompt creando sinonimos para iaehbdd_s2
Prompt =====================================
connect autos_bdd/autos_bdd@iaehbdd_s2
@s-04-autos-iaeh-s2-sinonimos.sql
@s-04-autos-valida-sinonimos.sql

Prompt Listo
disconnect