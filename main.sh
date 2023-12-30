#!/bin/bash

TIMEOUT=20

show_help() {
  echo "Uso: $0 [OPÇÕES]"
  echo "Opções:"
  echo "  -r   Verificação rápida"
  echo "  -h   Exibir este painel de ajuda"
  echo "  -a   Apontar um intervalo de rede (ex: -a 192.168.0.1/24)"
  exit 0
}

check_nmap() {
  command -v nmap >/dev/null 2>&1 || { echo >&2 "Nmap não está instalado. Por favor, instale-o."; exit 1; }
}

get_network_range() {
  local ip_address=$(hostname -I | awk '{print $1}')
  local network=$(ip route | grep $ip_address | awk '{print $1}')
  echo "$network"
}

scan_and_check_ports() {
  local network="$1"
  echo "Escaneando dispositivos na rede $network e verificando portas abertas..."

  nmap -sn $network | grep "Nmap scan report" | awk '{print $5}' | while read -r ip; do
    echo "Verificando portas abertas em $ip..."
    if [ "$FAST_SCAN" == "true" ]; then
      timeout $TIMEOUT nmap -p- -T4 $ip | grep ^[0-9] | awk '{print $1, $3}'
    else
      nmap -p- -T4 $ip | grep ^[0-9] | awk '{print $1, $3}'
    fi
    echo "-------------------------"
  done
}

try_connect() {
  local ip=$1
  local port=$2

  echo "Tentando conectar a $ip na porta $port..."
  
}

check_nmap

while getopts "rha:" opt; do
  case $opt in
    r)
      FAST_SCAN=true
      ;;
    h)
      show_help
      ;;
    a)
      scan_and_check_ports "$OPTARG"
      exit 0
      ;;
    \?)
      echo "Opção inválida: -$OPTARG"
      show_help
      ;;
  esac
done

if [ "$FAST_SCAN" == "true" ]; then
  scan_and_check_ports "$(get_network_range)"
else
  scan_and_check_ports "$(get_network_range)"
fi
