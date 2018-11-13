# --------------------------------------------------------------------------------------- #
# This shell script connects to the postgres database, runs the select query and          #
# insert data into the database                                                           #
# --------------------------------------------------------------------------------------- #

#!/bin/sh

# connect to the database
DATABASE=doordata
USERNAME=username
HOsTNAME=localhost
export PGPASSWORD=password

psql -h $HOSTNAME -U $USERNAME $DATABaSE << EOF
select * from door_activities
EOF
