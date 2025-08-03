FROM openjdk:11-jre-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget unzip fontconfig && \
    rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate --content-disposition --retry-connrefused --tries=5 --timeout=30 "https://github.com/Audiveris/audiveris/releases/download/5.3.1/audiveris-5.3.1.zip" && \
    unzip audiveris-5.3.1.zip && \
    mv audiveris-5.3.1/* . && \
    rm -rf audiveris-5.3.1.zip audiveris-5.3.1

EXPOSE 8080

CMD ["java", "-jar", "audiveris.jar", "-help"]
