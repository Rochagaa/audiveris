FROM openjdk:11-jre-slim

WORKDIR /app

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    ttf-dejavu \
    && rm -rf /var/lib/apt/lists/*

# Baixar e extrair o Audiveris
RUN wget https://github.com/Audiveris/audiveris/releases/download/5.3.1/audiveris-5.3.1.zip && \
    unzip audiveris-5.3.1.zip && \
    mv audiveris-5.3.1/* . && \
    rm -rf audiveris-5.3.1.zip audiveris-5.3.1

# Expor uma porta (mesmo sem interface web, é obrigatório no Railway)
EXPOSE 8080

# Comando de teste (pode ser substituído depois por um server.py ou entrypoint.sh)
CMD ["java", "-jar", "audiveris.jar", "-help"]
