
upstream jenkins.pgleon.com{

  server 106.15.191.139:8080 weight=5;
}

server {
  listen 80;
  server_name jenkins.pgleon.com;
  include location/jenkins.pgleon.com.conf;
}


