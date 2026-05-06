FROM eclipse-temurin:11-jre-jammy

RUN apt-get update && apt-get install -y unzip curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY clientportal.gw.zip ./clientportal.gw.zip
RUN unzip clientportal.gw.zip && rm clientportal.gw.zip

COPY conf.yaml ./root/conf.yaml

EXPOSE 5000

CMD ["bash", "bin/run.sh", "root/conf.yaml"]
