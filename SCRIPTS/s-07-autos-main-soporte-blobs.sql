--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Configura soporte de datos BLOB en cada nodo.

Prompt Configurando directorios y otorgando registros.
--caehbdd_s1
Prompt Configurando soporte BLOB para caehbdd_s1
connect autos_bdd/autos_bdd@caehbdd_s1
@s-07-autos-configuracion-soporte-blobs.sql
--caehbdd_s2
Prompt Configurando soporte BLOB para caehbdd_s2
connect autos_bdd/autos_bdd@caehbdd_s2
@s-07-autos-configuracion-soporte-blobs.sql
--iaehbdd_s1
Prompt Configurando soporte BLOB para iaehbdd_s1
connect autos_bdd/autos_bdd@iaehbdd_s1
@s-07-autos-configuracion-soporte-blobs.sql
--iaehbdd_s2
Prompt Configurando soporte BLOB para iaehbdd_s2
connect autos_bdd/autos_bdd@iaehbdd_s2
@s-07-autos-configuracion-soporte-blobs.sql

Prompt Listo
disconnect