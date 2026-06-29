#!/bin/bash -x
exec > >(tee -a logs/download_pokemon_world.log) 2>&1
ssh mpixel.zapto.org "cd build/minecraft && docker compose down"
rsync -avz --delete mpixel.zapto.org:/mnt/worlds/Cobblemon_World_Files/pokemon_world/ ./pokemon_world/
ssh mpixel.zapto.org "cd build/minecraft && docker compose up -d"
sleep 30
ssh mpixel.zapto.org "cd build/minecraft && docker compose logs"
echo "complete download"
