# Imagen base
FROM python:3.11-slim

# Directorio de trabajo dentro del container
WORKDIR /app

# Copiar archivos
COPY requirements.txt .
COPY app.py .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Puerto que expone la app
EXPOSE 5000

# Comando por defecto
CMD ["python", "app.py"]
