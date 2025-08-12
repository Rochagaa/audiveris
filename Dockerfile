FROM openjdk:17-jdk-slim

# Instala dependências
RUN apt-get update && apt-get install -y \
    wget unzip tesseract-ocr tesseract-ocr-eng fontconfig && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Baixa Audiveris versão 5.3.1
RUN wget --no-check-certificate --content-disposition \
    https://github.com/Audiveris/audiveris/releases/download/5.3.1/audiveris-5.3.1.zip && \
    unzip audiveris-5.3.1.zip && \
    mv audiveris-5.3.1/* . && \
    rm -rf audiveris-5.3.1 audiveris-5.3.1.zip

# Expor porta (se usar modo servidor)
EXPOSE 8080

# Comando padrão: modo batch (processar arquivos enviados)
CMD ["java", "-cp", "lib/*:audiveris.jar", "org.audiveris.omr.Main", "-batch", "-export", "-output", "/app/output"]
