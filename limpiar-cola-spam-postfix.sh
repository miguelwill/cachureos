#!/bin/bash

mailq|grep -i $1|sed s/\*//g |awk {'print $1'}|xargs -L1 postsuper -d
