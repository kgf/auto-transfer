#sqlite experimentation
#----------------------

# installation of sqllite onto the pi is done with this command
sudo apt-get install sqlite3

# creation of a "bema" database on the pi:
sqlite3 bema #create bema database

# creation of the schema:
create table devices( 
                      id varchar(64), 
                      name varchar(64), 
                      description varchar(128), 
                      PRIMARY KEY (id)
                    );

create table connect_history(
                      remoteid varchar(64), 
                      startdatetime timestamp, 
                      enddatetime timestamp, 
                      integer count, 
                      message varchar(128), 
                      PRIMARY KEY (remoteid, startdatetime, enddatetime)
                    );

create table files(
                      path varchar(255), 
                      transferdatetime timestamp, 
                      remoteid varchar(64), 
                      PRIMARY KEY (path)
                    );
