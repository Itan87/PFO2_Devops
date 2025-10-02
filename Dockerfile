# Usa una imagen base de Python ligera (para que la imagen final sea pequeña)
FROM python:3.10-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los requisitos e instálalos
# Usamos /tmp/ para evitar problemas de caché
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copia todo el código del proyecto (desde la raíz) al contenedor
COPY . /app

# Comando de inicio: Inicia el servidor Django, 0.0.0.0 es necesario para escuchar conexiones
CMD ["python", "practica_web/manage.py", "runserver", "0.0.0.0:8000"]