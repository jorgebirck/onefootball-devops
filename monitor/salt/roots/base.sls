Install Prerequisites:
  pkg.installed:
    - names: 
      - redis-server
      - libtool
      - autoconf

Install Erlang:
  cmd.run:
    - name: wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb ; dpkg -i erlang-solutions_1.0_all.deb ; apt-get update ; apt-get -y install socat erlang-nox

Install RabbitMQ:
  cmd.run:
    - name: wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.9/rabbitmq-server_3.6.9-1_all.deb ; dpkg -i rabbitmq-server_3.6.9-1_all.deb

Configure RabbitMQ Sensu credentials:
  cmd.run:
    - name: rabbitmqctl add_vhost /sensu ; rabbitmqctl add_user sensu secret ; rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

Add Sensu:
  cmd.run:
    - name: wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | sudo apt-key add -

Add Sensu repository:
  cmd.run:
    - name: echo "deb https://sensu.global.ssl.fastly.net/apt trusty main" | sudo tee /etc/apt/sources.list.d/sensu.list ; sudo apt-get update

sensu:
  pkg:
    - installed
  service:
    - running

uchiwa:
  pkg:
    - installed
  service:
    - running

Update Sensu config files:
  cmd.run:
    - name: wget -O /etc/sensu/config.json http://sensuapp.org/docs/1.2/files/config.json ; wget -O /etc/sensu/conf.d/check_disk.json http://sensuapp.org/docs/1.2/files/check_disk.json ; wget -O /etc/sensu/conf.d/default_handler.json http://sensuapp.org/docs/1.2/files/default_handler.json 

#Update client configuration:
/etc/sensu/conf.d/client.json:
  file:                   
    - managed
    - source: salt://client.json
    - user: root
    - group: root
    - mode: 644

#Update check_memory configuration:
/etc/sensu/conf.d/check_memory.json:
  file:
    - managed
    - source: salt://check_memory.json
    - user: root
    - group: root
    - mode: 644

#Update check_load configuration:
/etc/sensu/conf.d/check_load.json:
  file:
    - managed
    - source: salt://check_load.json
    - user: root
    - group: root
    - mode: 644

Run Sensu services:
  cmd.run:
    - name: /etc/init.d/sensu-server restart ; service sensu-client restart ; service sensu-api restart ; service uchiwa restart


#Update Uchiwa config with our 3 hosts:
/etc/sensu/uchiwa.json:
  file:
    - managed
    - source: salt://uchiwa.json
    - user: root
    - group: root
    - mode: 644

Restart Uchiwa service:
  cmd.run:
    - name: /etc/init.d/uchiwa restart

Install Ruby2.2:
  cmd.run:
    - name: apt-add-repository -y ppa:brightbox/ruby-ng ; apt-get update ; apt-get install -y ruby2.2 ruby2.2-dev

Use Ruby2:
  cmd.run:
    - name: update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.2 0 ; update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.2 0

Install Sensu plugins:
  cmd.run:
    - name: gem install sensu-plugins-memory-checks ; gem install sensu-plugins-load-checks ; gem install sensu-plugins-disk-usage
