# minecraft-paper
Minecraft Paper

This docker image provides a Minecraft Server that will automatically download Paper. The tag indicates the version of Paper being used. The parent image being uses the latest version of Ubuntu at build.

Example deployment via Docker:

docker run -d --name myminecraftserver -v /data/minecraft_data_folder:/mcdata -p 25565:25565 mlinarik/minecraft:paper-1.16.5-740

-d -- Detached -v -- Volume mount -p -- Port used for Minecraft

By using this image you agree to Minecraft/Mojang and Ubuntu/Canonical terms and conditions.

https://account.mojang.com/terms

https://ubuntu.com/legal/terms
