1.oracledb（200.200.200.200） 

Connect database with following setting:
  hostname: localhost
  port: 49161
  sid: xe
  username: system
  password: oracle
  Password for SYS & SYSTEM

oracle
  Login by SSH
  
  ssh vagrant@200.200.200.200
  ssh root@localhost -p 49160
  password: admin
  Support custom DB Initialization

# Reference
https://hub.docker.com/r/wnameless/oracle-xe-11g/

2.mysqldb（200.200.200.201）
https://hub.docker.com/r/mysql/mysql-server/

  hostname: 200.200.200.201
  port: 49162
  sid: ude
  username: ude
  password: ude
  Password for SYS & SYSTEM
  
Login by SSH<br>
ssh root@localhost -p 49160
password: ude

# Reference
https://hub.docker.com/r/wnameless/mysql-phpmyadmin/

3.postgresql（200.200.200.202）

Open http://200.200.0.202:49161/phppgadmin  in your browser with following credential:<br>
username: postgres 
password: postgres

Login by SSH 
ssh root@localhost -p 49160 
password: admin

# Reference
https://hub.docker.com/r/wnameless/postgresql-phppgadmin/