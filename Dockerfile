FROM eclipse-temurin:11-jre-jammy

RUN apt-get update && apt-get install -y wget unzip curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget -q https://download2.interactivebrokers.com/portal.zip -O portal.zip && \
    unzip portal.zip && \
    rm portal.zip

COPY conf.yaml /app/root/conf.yaml

EXPOSE 5000

CMD ["bash", "bin/run.sh", "root/conf.yaml"]
