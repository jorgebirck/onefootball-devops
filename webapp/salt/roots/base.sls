install Git:
  pkg.installed:
    - names: 
      - git

install Go:
  cmd.run:
    - name: wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz ; tar -xvf go1.9.3.linux-amd64.tar.gz ; mv go /usr/local ; export PATH="$PATH:/usr/local/go/bin" ; export GOPATH=$HOME/go

set env variable for Go executable:
  file.append:
    - name: ~/.bashrc
    - text: export PATH="$PATH:/usr/local/go/bin"

set env variable for GOPATH:
  file.append:
    - name: ~/.bashrc
    - text: export GOPATH=$HOME/go

download basic Go MVC Webapp:
  cmd.run:
    - name: export PATH="$PATH:/usr/local/go/bin" ; go get github.com/josephspurrier/gowebapp

#Configure MySQL as Backend for the webapp
/root/go/src/github.com/josephspurrier/gowebapp/config/config.json:
  file:                   
    - managed
    - source: salt://config/config.json
    - user: root
    - group: root
    - mode: 644

Build and run GoWebApp:
  cmd.run:
    - name: export PATH="$PATH:/usr/local/go/bin" ; cd ~/go/src/github.com/josephspurrier/gowebapp ; go build gowebapp.go

#Add GoWebApp in Supervisor / boot
/etc/init/gowebapp.conf:
  file:
    - managed
    - source: salt://gowebapp.conf
    - user: root
    - group: root
    - mode: 755

Run gowebapp:
  cmd.run:
    - name: start gowebapp
