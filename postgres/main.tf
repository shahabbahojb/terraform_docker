terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}


resource "docker_container" "postgres" {
  name  = "postgres-container"
  image = "postgres:latest"
  ports {
    internal = 5432
    external = 5436
  }
  env = [
    "POSTGRES_DB=mydatabase",
    "POSTGRES_USER=myuser",
    "POSTGRES_PASSWORD=mypassword"
  ]
  volumes {
    container_path = "/var/lib/postgresql/data"
    host_path      = "/tmp/docker-postgres-data"
  }
  restart = "always"
}


Certificate is saved at: /etc/letsencrypt/live/ger.shahabvip.shop/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/ger.shahabvip.shop/privkey.


38VQRzGRVYGr