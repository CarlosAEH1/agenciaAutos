--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       09/06/2022
--@Descripcion: Carga inicial de datos en cada nodo.

clear screen
set serveroutput on

Prompt ======================================
Prompt Preparando carga de Datos
Prompt ======================================
Prompt =>Seleccionar la PDB LOCAL para insertar datos
Prompt =>Para seleccionar una PDB remota, asegurarse que los archivos existen.
connect autos_bdd/autos_bdd@&pdb
Prompt => Personalizando el formato de fechas
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
Prompt => Al ocurrir un error se saldrá del programa y se hará rollback
whenever sqlerror exit rollback
Pause => Presionar Enter para Iniciar con la extracción de datos binarios, Ctrl-C para cancelar
--Invoca a un shell script para realizar la extracción y copia de archivos
!sh s-08-autos-presentacion-3.sh

Prompt ==================================================
Prompt ¿ Listo para Iniciar con la carga ?
Prompt ==================================================
Pause => Presionar Enter para Iniciar, Ctrl-C para cancelar
Prompt => Realizando limpieza inicial ....
set feedback off
delete from tarjeta_cliente;
delete from pago_auto;
delete from cliente;
delete from auto_particular;
delete from auto_carga;
delete from historico_status_auto;
delete from auto;
update sucursal_f1 set sucursal_anexa_id =null;
update sucursal_f2 set sucursal_anexa_id =null;
update sucursal_f3 set sucursal_anexa_id =null;
delete from sucursal;
delete from pais;
delete from modelo;
delete from marca;
set feedback on
Prompt => Insertando datos ....
set feedback off
Prompt => Insertando Paises
@carga-inicial/pais_ame.sql
@carga-inicial/pais_eur.sql
Prompt => Insertando Marcas
@carga-inicial/marca.sql
Prompt => Insertando Modelos
@carga-inicial/modelo.sql
Prompt => Insertando Sucursal- Parte 1
@carga-inicial/sucursal_1.sql
Prompt => Insertando Sucursal- Parte 2
@carga-inicial/sucursal_2.sql
Prompt => Insertando Autos - parte 1
@carga-inicial/auto_1.sql
--@carga-inicial/auto_empty_blob_1.sql
Prompt => Insertando Autos - parte 2
@carga-inicial/auto_2.sql
--@carga-inicial/auto_empty_blob_2.sql
Prompt => Insertando Autos particulares
@carga-inicial/auto_particular.sql
Prompt => Insertando Autos carga
@carga-inicial/auto_carga.sql
Prompt => Insertando Historico status Auto - Parte 1
@carga-inicial/historico_status_auto_1.sql
Prompt => Insertando Historico status Auto - Parte 2
@carga-inicial/historico_status_auto_2.sql
Prompt => Insertando Historico status Auto - Parte 3
@carga-inicial/historico_status_auto_3.sql
Prompt => Insertando Clientes
@carga-inicial/cliente.sql
Prompt => Insertando Pagos de auto - parte 1
@carga-inicial/pago_auto_1.sql
--@carga-inicial/pago_auto_empty_blob_1.sql
Prompt => Insertando Pagos de auto - parte 2
@carga-inicial/pago_auto_2.sql
--@carga-inicial/pago_auto_empty_blob_2.sql
Prompt => Insertando Tarjetas
@carga-inicial/tarjeta_cliente.sql
set feedback on

Prompt => Carga exitosa. Realizando commit
commit;

exit;