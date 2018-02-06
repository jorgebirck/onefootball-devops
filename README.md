# Instructions:

1) Install Vagrant: https://www.vagrantup.com/docs/installation/


2) Install the Salt Vagrant plugin from the commandline: 
~~~
$ vagrant plugin install vagrant-salt
~~~


3) To provision the "Database" , clone this repo and run: 
~~~
$ cd onefootball-devops/database ; vagrant up
~~~


4) To provision the "Webapp" , clone this repo and run: 
~~~
$ cd onefootball-devops/webapp ; vagrant up 
~~~




Database user and password is "webapp" : mysql -uwebapp -pwebapp -h127.0.0.1
