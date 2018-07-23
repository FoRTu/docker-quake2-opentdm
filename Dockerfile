FROM debian:stable-slim

LABEL maintainer="FoRTu" \
maintainet.email="mikelfortuna@gmail.com" \
maintainer.website="https://fortu.io/"

WORKDIR /opt/quake2-opentdm-server

ENV Q2_PORT="27911"
ENV Q2_HOSTNAME="Docker Quake2 OpenTDM Server"
ENV Q2_MAXCLIENTS="10"
ENV Q2_ADMIN="admin"
ENV Q2_ADMIN_PASSWORD="AdminPassw0rd"
ENV Q2_RCON_PASSWD="Rc0nPassw0rd"
ENV Q2_ADMIN_EMAIL="admin@example.com"
ENV Q2_ADMIN_WEBPAGE="https://example.com"
ENV Q2_MOTD="[=======================]\n\nQuake 2 OpenTDM Server\n(Docker Container)\n\nType 'menu' on console\n\n[=======================]"
ENV Q2_TIMELIMIT="30"
ENV Q2_FRAGLIMIT="25"
ENV Q2_IDLETIME="30"

# Install Updates + Quake2 & OpenFFA MOD:
RUN apt update && \
apt upgrade -y && \
apt -y install curl apt-transport-https gnupg && \
curl -L "https://apt.fortu.io/repo.key" | apt-key add - && \
echo "deb https://apt.fortu.io/ stretch main contrib non-free" | tee -a /etc/apt/sources.list && \
apt update && \
apt install -y quake2-opentdm-server && \
apt purge -y curl apt-transport-https gnupg && \
apt-get -y autoclean && \
apt-get -y autoremove && \
rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/* \
        /var/cache/debconf/*-old \
        /var/lib/apt/lists/* \
        /usr/share/doc/*

# Add server configuration file
COPY AddFiles/server.cfg /opt/quake2-opentdm-server/opentdm/

# Define the user
RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser

EXPOSE 27911/tcp
EXPOSE 27911/udp

# Command to run on container startup
CMD /opt/quake2-opentdm-server/r1q2ded +set game opentdm \
+set port "$Q2_PORT" \
+set hostname "$Q2_HOSTNAME" \
+set maxclients "$Q2_MAXCLIENTS" \
+set ServerAdmin "$Q2_ADMIN" \
+set g_admin_password "$Q2_ADMIN_PASSWORD" \
+set rcon_password "$Q2_RCON_PASSWD" \
+set email "$Q2_ADMIN_EMAIL" \
+set webpage "$Q2_ADMIN_WEBPAGE" \
+set g_motd_message "$Q2_MOTD" \
+set timelimit "$Q2_TIMELIMIT" \
+set fraglimit "$Q2_FRAGLIMIT" \
+set g_idle_time "$Q2_IDLETIME" \
+exec ./server.cfg
