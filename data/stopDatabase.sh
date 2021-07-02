#!/bin/bash

java -jar ../lib/sqltool-2.5.1.jar --rcFile=sqlTool.rc --sql 'SHUTDOWN COMPACT;' potatosqltest
