# Práctica Formativa Obligatoria 2 - DevOps

Este proyecto forma parte de la materia **Seminario de DevOps** de la Tecnicatura SDS.  
El objetivo es practicar la creación de un entorno de desarrollo con **Docker** y desplegar una aplicación web sencilla en **Django con Mysql**.

## 🚀 Funcionalidades
- Tabla de usuarios con nombre e email como ejemplo práctico de integración de Django en un contenedor Docker.

## 🛠️ Tecnologías
- Python 3
- Django 5.x
- Mysql
- Docker / Docker Toolbox. En este caso, se uso **Github Codespaces** debido a limitaciones del entorno.

## Instrucciones de Ejecución

### 1. Iniciar el Entorno

El proyecto se levanta con `docker-compose`, que construye la imagen y arranca los contenedores `web` y `db`:

```bash
# Comando para construir e iniciar los servicios en segundo plano
docker-compose up --build -d


Puertos: La aplicación web está expuesta en el puerto de host 8000.

### 2. Llenado de la Base de Datos

La base de datos MySQL se configura con credenciales de desarrollo en el docker-compose.yml.

# 1. Conectarse al contenedor de MySQL (reemplace [Contraseña-de-Root] según docker-compose.yml)
docker exec -it mysql_practica_db mysql -u root -p[Contraseña-de-Root]

# 2. Comandos dentro de la consola MySQL (para crear la tabla y los 10 registros)
USE practica;
CREATE TABLE usuarios ( id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100), email VARCHAR(100) );
INSERT INTO usuarios (nombre, email) VALUES (...); # Inserción de 10 registros
quit;

###3. Archivos y Configuración Clave
Dockerfile: Contiene la lógica de construcción de la imagen de Django. Incluye la solución al error de pkg-config mediante la instalación de paquetes de compilación críticos (default-libmysqlclient-dev).

docker-compose.yml: Orquesta el servicio web (dependiente de db) y configura las variables de entorno para la conexión de Django (DB_HOST=db, DB_PASSWORD=12345).

### Problemas y soluciones

Problema	Solución Implementada

Falla de Docker Local (VirtualBox E_FAIL)	Migración inmediata al entorno en la nube GitHub Codespaces
Error de pkg-config: not found	Se agregaron los paquetes de compilación necesarios al Dockerfile
Fallo de Autenticación en Docker Hub	Logout/Login forzado en Codespaces para renovar permisos de docker push

#### Entrega Final
El artefacto final se subió a Docker Hub.

Imagen Docker: itan87/practica-docker-django:v1

Comando de Entrega Final: docker push itan87/practica-docker-django:v1
