zendhola
========

zendhola

Introduccion
--------

Proyecto en zendframework 1.12 corre de manera local siguiendo las siguientes configuraciones 


Crear el host en ubuntu:

Para que corra el proyecto se debe crear un virtualhost de manera local para asi no tener problema de url_base en el proyecto ,
si no se desea crear un virtual host tener en consideracion cambiar el url_base de proyecto el aplication.ini
 
En el archivo zendhola/docs/README.txt nos describe la configuración básica que necesitamos para crear el host virtual, para crear el host haz lo siguiente:

-Crea el archivo de configuración desde un terminal con permisos de superusuario
gedit /etc/apache2/sites-available/zendhola.conf

Pega el XML descrito en zendhola/docs/README.txt y guarda el archivo. Luego entra en:
cd /etc/apache2/sites-enabled/

Para crear el enlace al archivo que hemos creado:
ln -s ../sites-available/zendhola.conf

-Para configurar los host edita el el archivo /etc/hosts para poner el nombre del dominio: “127.0.1.1 zendhola.local”

-Reinicia Apache para que coja los cambios
service apache2 restart

-Ahora accede desde tu navegador a:
http://zendhola.local/

-Si se esta accediendo a traves de un proxy habilitar que haga un excepcion para zendhola.local


En caso de recibir un error de permisos incluir antes de </Directory> del archivo /etc/apache2/sites-available/zendhola.conf la línea:
Require all granted

Si continua fallando otorga los privilegios apropiados:
chmod -R 755 ~/workspace/zendhola


