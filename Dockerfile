#FROM openjdk:8-jdk-alpine
FROM timbru31/java-node

RUN mkdir /app
COPY . /app/
RUN cd /app && npm install -g generator-jhipster yo@latest
CMD tail -f /dev/null
