#!/bin/bash

# Secure Linux - script de hardening para Debian/Ubuntu
# Testeado en Ubuntu 22.04 y Debian 11
# Ejecutar como root en una maquina virtual primero

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# comprobamos que se ejecuta como root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}ejecuta el script como root: sudo bash securing.sh${NC}"
    exit 1
fi

# solo funciona en distros con apt (debian/ubuntu)
if ! command -v apt &>/dev/null; then
    echo -e "${RED}este script solo es compatible con debian/ubuntu${NC}"
    exit 1
fi

echo -e "${BLUE}Secure Linux v1.0${NC}"
echo ""

# --- SSH ---
# desactivamos root login, forzamos clave publica y cerramos sesiones inactivas
echo -e "${YELLOW}configurando SSH...${NC}"

if [[ ! -f /etc/ssh/sshd_config ]]; then
    echo -e "${RED}no se encuentra sshd_config, tienes openssh instalado?${NC}"
    exit 1
fi

# backup por si algo sale mal
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
echo -e "${GREEN}backup guardado en /etc/ssh/sshd_config.bak${NC}"

cp configs/sshd_config /etc/ssh/sshd_config

systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null
echo -e "${GREEN}SSH listo${NC}"

echo ""
echo -e "${GREEN}hardening completado.${NC}"