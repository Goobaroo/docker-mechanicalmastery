# syntax=docker/dockerfile:1

FROM openjdk:17-buster

LABEL version="1.5.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="Mechanical Mastery-r1.5.0"
LABEL homepage.icon="https://media.forgecdn.net/avatars/611/624/637996243327645389.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://Mechanical-Mastery:25565
RUN apt-get update && apt-get install -y curl unzip && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

CMD ["/launch.sh"]