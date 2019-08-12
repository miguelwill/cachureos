#!/bin/bash

cd /etc/perdition

makegdbm popmap.gdbm.db < popmap

/etc/init.d/perdition restart

rsync /etc/perdition/ -hva --progress -e ssh root@perdition2:/etc/perdition/

ssh root@perdition2 "/etc/init.d/perdition restart"
