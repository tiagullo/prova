#Set variabili Jinja2
{% set path = 'http://mirror.nohup.it/apache/tomcat/tomcat-9/' %}
{% set TOMCAT_HOME = '/opt/tomcat' %}
{% set TOMCAT_CONF = '/opt/tomcat/apache-tomcat-9.0.6/conf' %}
{% set MASTER_OPT = 'salt://template' %}
{% set PATH_SYSTEM = '/etc/systemd/system' %}

#check java packet 
installa_java:
  pkg.installed:
    - name: java-1.8.0-openjdk 

#Estrazione archivio usando il source come link dove prendere il tar e name come destinazione dell'estrazione 
#source_hash è in più per check hash del file. Se non lo voglio usare, basta metter skip_hash=True
extract arch:
  archive.extracted:
    - name: {{TOMCAT_HOME}}
    - source: {{path}}/v9.0.6/bin/apache-tomcat-9.0.6.tar.gz
    - source_hash: 8cea5d0701773da1a0b2c2a6ec744b66eb8b2f34

#modifico file server.xml dentro minion di riferimento usando file da master che farà confronto e sostituzione delle 
#cose diverse. 
change file:
  file.managed:
    - name: {{TOMCAT_CONF}}/server.xml
    - source: {{MASTER_OPT}}/server.xml.template
    - mode: 644


#sposto file service per creare servizio tomcat in systemd
Tomcat service: 
  file.managed:
    - name: {{PATH_SYSTEM}}/tomcat.service
    - source: {{MASTER_OPT}}/tomcat_service.template

#avvio il servizio di tomcat /opt/tomcat/apache-tomcat-9.0.6/bin
start_on_boot:
  service.running:
    - name: tomcat
    - enable: true
    - reload: True