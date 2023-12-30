#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "é necessario ter permissões root!"
  exit 1
fi

ln -s "$(pwd)/main.sh" /usr/local/bin/netprobe

echo "NetProbe foi instalado com sucesso. Para executar o NetProbeV2, utilize o comando "netprobe -h"!"
