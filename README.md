![Quake 2 logo](q2logo.png)

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
Q2_PORT="27911"
Q2_HOSTNAME="Docker Quake2 OpenTDM Server"
Q2_MAXCLIENTS="10"
Q2_ADMIN="admin"
Q2_ADMIN_PASSWORD="AdminPassw0rd"
Q2_RCON_PASSWD="Rc0nPassw0rd"
Q2_ADMIN_EMAIL="admin@example.com"
Q2_ADMIN_WEBPAGE="https://example.com"
Q2_MOTD="[=======================]\n\nQuake 2 OpenTDM Server\n(Docker Container)\n\nType 'menu' on console\n\n[=======================]"
Q2_TIMELIMIT="30"
Q2_FRAGLIMIT="25"
Q2_IDLETIME="30"
```

You can change as many as you want using the `-e` or `--env` option. For example:

```
docker run -d --rm --name "Quake2_OpenTDM" -p 27910:27910/tcp -p 27910:27910/udp --env Q2_HOSTNAME="Q2 OpenTDM #1" 0d8cf1e41ba7
docker run -d --rm --name "Quake2_OpenTDM" -p 27910:27910/tcp -p 27910:27910/udp --env Q2_HOSTNAME="Q2 OpenTDM #2" 0d8cf1e41ba7
docker run -d --rm --name "Quake2_OpenTDM" -p 27911:27911/tcp -p 27911:27911/udp --env Q2_PORT="27911" --env Q2_HOSTNAME="Q2 OpenTDM #3" 0d8cf1e41ba7
docker run -d --rm --name "Quake2_OpenTDM" -p 27912:27912/tcp -p 27912:27912/udp --env Q2_PORT="27912" --env Q2Q2_FRAG="15" 0d8cf1e41ba7
...
```

Enjoy playing Quake!
