FROM openjdk:11-jre-slim

WORKDIR /app

# Instala dependências básicas
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://github.com/Audiveris/audiveris/releases/download/5.3.1/audiveris-5.3.1.zip && \
    unzip audiveris-5.3.1.zip && \
    mv audiveris-5.3.1/* . && \
    rm -rf audiveris-5.3.1.zip audiveris-5.3.1

# Exponha a porta padrão (se estiver usando a interface web)
EXPOSE 8080

# Comando de execução (modo gráfico desativado)
CMD ["java", "-jar", "audiveris.jar", "-batch"]
