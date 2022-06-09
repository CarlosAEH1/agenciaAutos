--@Autor:       Elizarraras Herrera Carlos Amador
--@Fecha:       08/06/2022
--@Descripcion: Crea triggers en cada nodo.

clear screen
whenever sqlerror exit rollback;

Prompt =====================================
Prompt Creando triggers para caehbdd_s1
Prompt =====================================
connect autos_bdd/autos_bdd@caehbdd_s1
@s-06-autos-pais-trigger.sql --El mismo para todos los nodos
@s-06-autos-caeh-s1-sucursal-trigger.sql
@s-06-autos-caeh-s1-auto-trigger.sql
@s-06-autos-caeh-s1-auto-particular-trigger.sql
@s-06-autos-caeh-s1-auto-carga-trigger.sql
@s-06-autos-historico-status-auto-trigger.sql --El mismo para todos los nodos
@s-06-autos-cliente-trigger.sql --El mismo para todos
@s-06-autos-caeh-s1-pago-auto-trigger.sql
@s-06-autos-tarjeta-cliente-trigger.sql --El mismo para todos
--Tablas replicadas
@s-06-autos-marca-trigger.sql --El mismo para todos
@s-06-autos-modelo-trigger.sql --El mismo para todos
Prompt =====================================
Prompt Creando triggers para caehbdd_s2
Prompt =====================================
connect autos_bdd/autos_bdd@caehbdd_s2
@s-06-autos-pais-trigger.sql --El mismo para todos los nodos
@s-06-autos-caeh-s2-sucursal-trigger.sql
@s-06-autos-caeh-s2-auto-trigger.sql
@s-06-autos-caeh-s2-auto-particular-trigger.sql
@s-06-autos-caeh-s2-auto-carga-trigger.sql
@s-06-autos-historico-status-auto-trigger.sql --El mismo para todos los nodos
@s-06-autos-cliente-trigger.sql --El mismo para todos
@s-06-autos-caeh-s2-pago-auto-trigger.sql
@s-06-autos-tarjeta-cliente-trigger.sql --El mismo para todos
--Tablas replicadas
@s-06-autos-marca-trigger.sql --El mismo para todos
@s-06-autos-modelo-trigger.sql --El mismo para todos
Prompt =====================================
Prompt Creando triggers para iaehbdd_s1
Prompt =====================================
connect autos_bdd/autos_bdd@iaehbdd_s1
@s-06-autos-pais-trigger.sql --El mismo para todos los nodos
@s-06-autos-caeh-s1-sucursal-trigger.sql -- reutilizando script
@s-06-autos-caeh-s1-auto-trigger.sql -- reutilizando script
@s-06-autos-caeh-s1-auto-particular-trigger.sql --reutilizando script
@s-06-autos-caeh-s1-auto-carga-trigger.sql --reutilizando script
@s-06-autos-historico-status-auto-trigger.sql --El mismo para todos los nodos
@s-06-autos-cliente-trigger.sql --El mismo para todos
@s-06-autos-iaeh-s1-pago-auto-trigger.sql
@s-06-autos-tarjeta-cliente-trigger.sql --El mismo para todos
--Tablas replicadas
@s-06-autos-marca-trigger.sql --El mismo para todos
@s-06-autos-modelo-trigger.sql --El mismo para todos
Prompt =====================================
Prompt Creando triggers para iaehbdd_s2
Prompt =====================================
connect autos_bdd/autos_bdd@iaehbdd_s2
@s-06-autos-pais-trigger.sql --El mismo para todos los nodos
@s-06-autos-caeh-s1-sucursal-trigger.sql -- reutilizando script
@s-06-autos-iaeh-s2-auto-trigger.sql -- aqui no se reutiliza por tener el dato BLOB
@s-06-autos-caeh-s1-auto-particular-trigger.sql --reutilizando script
@s-06-autos-caeh-s1-auto-carga-trigger.sql --reutilizando script
@s-06-autos-historico-status-auto-trigger.sql --El mismo para todos los nodos
@s-06-autos-cliente-trigger.sql --El mismo para todos
@s-06-autos-iaeh-s2-pago-auto-trigger.sql
@s-06-autos-tarjeta-cliente-trigger.sql --El mismo para todos
--Tablas replicadas
@s-06-autos-marca-trigger.sql --El mismo para todos
@s-06-autos-modelo-trigger.sql --El mismo para todos

Prompt Listo
disconnect