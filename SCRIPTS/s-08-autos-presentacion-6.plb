


Prompt selecccionar la PDB para validar
connect autos_bdd/autos_bdd@&pdb

whenever sqlerror exit rollback;

set serveroutput on

Prompt creando procedimientos para validar

create or replace procedure sp_valida_eliminacion wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
12f 150
67/8KsJUcrH3rmrMNDNlFC+0UaYwg0xK1ydqfC9GEg2vu0t4MY9vtiOZy4VhJeN78bPQZOYa
6OcJrYVrsHrPQyVnfTg4yXU6tDWlp/WjL1TRiwVBVQcq6zEQrSCuSDNCpxuM3r7JnhYd6NCy
82xfYO7oxvYh4LMcS7SR3vvDyd6EGRZt1UVyu2pMRERNHZOGonDF9K9qUOtv1ZdYqOa49yQg
5eUjYvducJuwMQ/WsgNboEjxBc3/kgPnFdIpp/Z1nFSqEXP5XH6MSe0U9mgqgN5TK9YrlghZ
roj6zEyx2o+7bMMoGm2yb1AkdB6puYwY4PjSHR5KafQ=

/
show errors


create or replace procedure sp_valida_eliminacion_main wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
fad 2c1
352pCGCwF+5MmZNCp2l92KtGSQgwg2ONDCATZ45gmA1stVufLQpWBm2/ky6l25CeghEEwqTw
5y4mSy0w0v6xZlPww1xFLFUP/4iQQsirpPoQSJFQTGiuD+pkGY0yMuX/vE3sA9o6/HZNfg1x
NFNawfSy8eTOFNcj+Li1S0JxYk9dNWwKQzJwvoWRVu/9X8cechNnbCtbxLtB8CI5JmlYEhmH
nbqRJhLzLYOZSQsyw/Tjidw869JzVZXqkPhh7QVfA1l8La9GqVh380KkAY1Xnra9F1c+3Lxi
NPYxYhshCLM2UYQie8+ATjHaIhJbYhPZ7Xnvmdj+ZTxHeX6H2UU1M1KstqZJjhzhuHCWSZLL
DrtLYwP6xHNdGUdW0MC39HX+3DKEf6CQZDfE/NCpyvvurC/TRk2mDoTQjIU7i0P+hJqmKZqv
2zm2Ocsxjy/7giZe4IvrKuJXlNTlFtAC+8APzwXqlWn4b2K1zIDH9SFeB5jInd0WbUat5w7g
7gV40DluFDby55xnORQ8H42TecMaTMkC14LGnYqaCuIgg+URcbH4P312MPi1a+g6J5KWgXGW
8doYjVnYXUTR/OV6/mzI0nhBL3qvzi+vB8pBcmCXsAYON2oQCCCyIw4kFudeL9hnzlob1Ufq
3gLWyye7BSwBu6Q/cLUls3ak13fu4j5jWTPQTz/7X4Wi2A==

/
show errors

Prompt ======================================
Prompt Iniciando validacion - Delete
Prompt ======================================

exec sp_elimina_datos
Prompt Datos Eliminados, verificando ..
exec sp_valida_eliminacion_main

prompt Listo
exit