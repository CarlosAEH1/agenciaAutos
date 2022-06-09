--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea BDD.

clear screen
whenever sqlerror exit rollback;

Prompt Creando BDD.
@s-01-autos-main-usuario.sql
@s-02-autos-ligas.sql
@s-03-autos-main-ddl.sql
@s-04-autos-main-sinonimos.sql
@s-05-autos-main-vistas.sql
@s-06-autos-main-triggers.sql
@s-07-autos-main-soporte-blobs.sql

Prompt Listo
exit