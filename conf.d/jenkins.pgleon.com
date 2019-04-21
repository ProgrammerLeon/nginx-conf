
upstream jenkins.pgleon.com{

  server 106.15.191.139:8080 weight=5;
}

server {
  listen 80;
  server_name jenkins.pgleon.com;

  location / {
      proxy_pass http://nexus.pgleon.com;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto "http";
    }
}


