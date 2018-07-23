![Quake 2 logo](https://raw.githubusercontent.com/FoRTu/docker-quake2-opentdm/master/q2logo.png)

# Quake 2 OpenTDM Dedicated Server

Dockerized version of [Quake 2](https://es.wikipedia.org/wiki/Quake_II)  dedicated server with the [OpenTDM](http://opentdm.net/) mod. Using prebuilt [r1q2ded](https://github.com/tastyspleen/r1q2-archive) debian package of [my own repository](https://apt.fortu.io/en.index.html), you can easily create a server to play quake 2 multiplayer. Thanks to the magic of Docker you can create as many servers as you want by changing only some environment variables.

## Usage

Running the following command will get a default server:

```
docker run -d --rm --name "Quake2_OpenTDM" -p [HOST PORT]:[CONTAINER PORT]/tcp -p [HOST PORT]:[CONTAINER PORT]/udp [IMAGE ID]
```

For example:

```
docker run -d --rm --name "Quake2_OpenTDM" -p 27911:27911/tcp -p 27911:27911/udp 0d8cf1e41b00
```

But if you want to customize the server, you can use the environment variables. These are the variables with the default values:

```
ENV Q2_PORT="27911"
ENV Q2_HOSTNAME="Docker Quake2 OpenTDM Server"
ENV Q2_MAX_PLAYERS_PER_TEAM="4"
ENV Q2_ADMIN_PASSWORD="AdminPassw0rd"
ENV Q2_ADMIN_WEBPAGE="https://example.com"
ENV Q2_MOTD="[=======================]\n\nQuake 2 OpenTDM Server\n(Docker Container)\n\nType 'menu' on console\n\n[=======================]"
ENV Q2_IDLETIME="30"
ENV Q2_TEAM_A_NAME="[Red-Team]"
ENV Q2_TEAM_B_NAME="[Blue-Team]"
ENV Q2_MATCH_TIME="900"
ENV Q2_MATCH_COUNTDOWN="20"
ENV Q2_VOTE_TIME="35"
ENV Q2_RESPAWN_TIME="5"
```

You can change as many as you want using the `-e` or `--env` option. For example:

```
docker run -d --rm --name "Quake2_OpenTDM" -p 27911:27911/tcp -p 27911:27911/udp --env Q2_HOSTNAME="Q2 OpenTDM #1" 0d8cf1e41b07
docker run -d --rm --name "Quake2_OpenTDM" -p 27911:27911/tcp -p 27911:27911/udp --env Q2_HOSTNAME="Q2 OpenTDM #2" 0d8cf1e41b07
docker run -d --rm --name "Quake2_OpenTDM" -p 27912:27912/tcp -p 27912:27912/udp --env Q2_PORT="27912" --env Q2_HOSTNAME="Q2 OpenTDM #3" 0d8cf1e41b07
docker run -d --rm --name "Quake2_OpenTDM" -p 27913:27913/tcp -p 27913:27913/udp --env Q2_PORT="27913" --env Q2_TEAM_A_NAME="[A-Team]" --env Q2_TEAM_B_NAME="[B-Team]" 0d8cf1e41b07
...
```

Enjoy playing Quake!
