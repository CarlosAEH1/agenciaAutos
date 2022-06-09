--@Autor:           Elizarraras Herrera Carlos Amador
--@Fecha creación:  07/06/2022
--@Descripción: Crea de vistas para tablas con datos BLOB en cada nodo.

clear screen
whenever sqlerror exit rollback;

Prompt ===========================================
Prompt Creando vistas para caehbdd_s1
Prompt ===========================================
connect autos_bdd/autos_bdd@caehbdd_s1
Prompt Creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql
Prompt Creando tablas temporales
@s-05-autos-tablas-temporales.sql
Prompt Creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql
Prompt Creando vistas con soporte para BLOBs
@s-05-autos-caeh-s1-vistas-blob.sql
Prompt ===========================================
Prompt Creando vistas para caehbdd_s2
Prompt ===========================================
connect autos_bdd/autos_bdd@caehbdd_s2
Prompt Creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql
Prompt Creando tablas temporales
@s-05-autos-tablas-temporales.sql
Prompt Creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql
Prompt Creando vistas con soporte para BLOBs
@s-05-autos-caeh-s2-vistas-blob.sql
Prompt ===========================================
Prompt Creando vistas para iaehbdd_s1
Prompt ===========================================
connect autos_bdd/autos_bdd@iaehbdd_s1
Prompt Creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql
Prompt Creando tablas temporales
@s-05-autos-tablas-temporales.sql
Prompt Creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql
Prompt Creando vistas con soporte para BLOBs
@s-05-autos-iaeh-s1-vistas-blob.sql
Prompt ===========================================
Prompt Creando vistas para iaehbdd_s2
Prompt ===========================================
connect autos_bdd/autos_bdd@iaehbdd_s2
Prompt Creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql
Prompt Creando tablas temporales
@s-05-autos-tablas-temporales.sql
Prompt Creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql
Prompt Creando vistas con soporte para BLOBs
@s-05-autos-iaeh-s2-vistas-blob.sql

Prompt Listo!
disconnect