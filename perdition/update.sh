#!/bin/bash

cd /etc/perdition

#actualiza archivo "popmap.gdbm.db" con el contenido de archivo "popmap"
makegdbm popmap.gdbm.db < popmap

#reinicio servicio perdition para actualizacion de cambios
/etc/init.d/perdition restart

