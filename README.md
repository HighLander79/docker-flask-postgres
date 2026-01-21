# Flask + PostgreSQL con Docker Compose

![CI Pipeline](https://github.com/TU-USUARIO/docker-flask-postgres/actions/workflows/ci.yml/badge.svg)

Aplicación Flask conectada a PostgreSQL usando Docker Compose. Proyecto de aprendizaje Docker para portfolio DevOps.

## 🏗️ Arquitectura

```
┌─────────────────┐      ┌──────────────────┐
│   Flask Web     │─────▶│   PostgreSQL     │
│   (Python 3.11) │      │   (v15)          │
│   Port: 5000    │      │   Port: 5432     │
└─────────────────┘      └──────────────────┘
        │                         │
        └─────────┬───────────────┘
              mi-red (Docker network)
```

## 🚀 Características

- **Flask** - Framework web Python
- **PostgreSQL 15** - Base de datos relacional
- **Docker Compose** - Orquestación multi-container
- **Volúmenes persistentes** - Datos de PostgreSQL persisten entre reinicios
- **Red personalizada** - Containers se comunican por nombre
- **Variables de entorno** - Configuración externalizada

## 📋 Prerequisitos

- Docker Desktop instalado
- Git (para clonar el repo)

## 🛠️ Instalación y uso

### 1. Clonar repositorio
```bash
git clone <tu-repo-url>
cd leccion_flask
```

### 2. Levantar servicios
```bash
docker compose up --build
```

### 3. Acceder a la aplicación
Abre el navegador en: http://localhost:5000

Deberías ver:
```
Conectado a PostgreSQL: PostgreSQL 15.x on x86_64-pc-linux-gnu...
```

### 4. Detener servicios
```bash
# Ctrl + C en la terminal donde corre

# O si corrió en background (-d):
docker compose down
```

## 📁 Estructura del proyecto

```
leccion_flask/
├── app.py                 # Aplicación Flask
├── requirements.txt       # Dependencias Python
├── Dockerfile            # Imagen Flask personalizada
├── docker-compose.yml    # Orquestación servicios
└── README.md            # Este archivo
```

## 🔧 Configuración

### Variables de entorno (docker-compose.yml)

**PostgreSQL:**
- `POSTGRES_USER`: postgres
- `POSTGRES_PASSWORD`: secret
- `POSTGRES_DB`: mydb

**Flask:**
- `DATABASE_URL`: postgresql://postgres:secret@db:5432/mydb

### Volúmenes

- `postgres-data`: Persiste datos de PostgreSQL en `/var/lib/postgresql/data`

### Red

- `mi-red`: Red bridge personalizada para comunicación entre containers

## 🧪 Comandos útiles

```bash
# Ver containers corriendo
docker compose ps

# Ver logs
docker compose logs
docker compose logs web
docker compose logs db

# Reconstruir imágenes
docker compose build

# Levantar en background
docker compose up -d

# Parar y eliminar todo (incluyendo volúmenes)
docker compose down -v

# Acceder a la shell de PostgreSQL
docker compose exec db psql -U postgres -d mydb
```

## 🧠 Conceptos aplicados

- **Containerización** de aplicaciones Python
- **Docker Compose** para orquestación multi-container
- **Redes Docker** personalizadas
- **Volúmenes** para persistencia de datos
- **Variables de entorno** para configuración
- **Dependencias entre servicios** (`depends_on`)

## 🔐 Notas de seguridad

⚠️ **Este es un proyecto de aprendizaje.** En producción:
- Usar secretos gestionados (Docker Secrets, Vault)
- No hardcodear passwords en docker-compose.yml
- Usar usuario no-root en containers
- Implementar health checks

## 📚 Mejoras futuras

- [ ] Health checks en docker-compose.yml
- [ ] Multi-stage build en Dockerfile
- [ ] Usuario no-root
- [ ] .dockerignore
- [ ] Tests unitarios
- [ ] GitHub Actions CI/CD

## 👨‍💻 Autor

**David** - DBA Azure en transición a DevOps/SRE

Parte del roadmap de aprendizaje Docker → CI/CD → Terraform → Kubernetes
