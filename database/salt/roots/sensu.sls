Add Sensu repository:
  cmd.run:
    - name: wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | sudo apt-key add - ; echo "deb https://sensu.global.ssl.fastly.net/apt trusty main" | sudo tee /etc/apt/sources.list.d/sensu.list ; sudo apt-get update

sensu:
  pkg:
    - installed
    - names:
      - sensu
  service:
    - running


#Add client config files to connect to sensu server 192.168.51.3
/etc/sensu/conf.d/client.json:
  file:                   
    - managed
    - source: salt://client.json
    - user: root
    - group: root
    - mode: 644

/etc/sensu/conf.d/transport.json:
  file:
    - managed
    - source: salt://transport.json
    - user: root
    - group: root
    - mode: 644

/etc/sensu/conf.d/rabbitmq.json:
  file:
    - managed
    - source: salt://rabbitmq.json
    - user: root
    - group: root
    - mode: 644

Apply changes:
  cmd.run:
    - name: /etc/init.d/sensu-client restart 
