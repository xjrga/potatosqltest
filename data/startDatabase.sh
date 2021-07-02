#!/bin/sh

#db=file:database/potatosqltestdb, alias=potatosqltest
java -cp ../lib/hsqldb-2.5.1.jar org.hsqldb.server.Server --port 9002 --database.0 file:database/potatosqltestdb --dbname.0 potatosqltest