Add Uchiwa pubkey:
  cmd.run:
    - name: wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | sudo apt-key add -

Add Uchiwa repository:
  cmd.run:
    - name: echo "deb https://sensu.global.ssl.fastly.net/apt trusty main" | sudo tee /etc/apt/sources.list.d/sensu.list

uchiwa:
  pkg:
    - installed
  service:
    - running

#Update bind address to make it reachable over the Virtualbox Network:
#  cmd.run:
#    - name: sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf ; service mysql restart 

#Prepare gowebapp SQL for restore
#/root/mysql.sql:
#  file:                   
#    - managed
#    - source: salt://mysql.sql
#    - user: root
#    - group: root
#    - mode: 644
