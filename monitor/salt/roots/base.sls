mysql:
  pkg:
    - installed
    - names:
      - mysql-server-5.6
  service:
    - running

Update bind address to make it reachable over the Virtualbox Network:
  cmd.run:
    - name: sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf ; service mysql restart 

#Prepare gowebapp SQL for restore
/root/mysql.sql:
  file:                   
    - managed
    - source: salt://mysql.sql
    - user: root
    - group: root
    - mode: 644

Restore SQL file:
  cmd.run:
    - name: mysql -f -uroot < mysql.sql

Add webapp user and password:
  cmd.run:
    - name: mysql -uroot -e "grant all on gowebapp.* to webapp@'%' identified by 'webapp';"
