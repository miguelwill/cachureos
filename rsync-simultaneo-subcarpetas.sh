#!/bin/bash

DIR=/mnt/tmp
DEST=/mnt/data/mirror

JOBS=5
RSYNCOPTS="-hvaHl --progress --numeric-ids"


ls  $DIR | xargs -I {} -P $JOBS -n 1 rsync $RSYNCOPTS $DIR/{} $DEST/
