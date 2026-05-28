# Secure Linux

Script bash de bastionado para sistemas Debian/Ubuntu.
Lo estoy desarrollando por fases mientras aprendo, así que irá creciendo.

Probado en Ubuntu 22.04 y Debian 12. No lo puedo garantizar en otras distros.

## Qué hace (por ahora)

- Endurece la configuración SSH: desactiva root, fuerza autenticación por clave, cierra sesiones inactivas
- Hace backup de los ficheros de configuración originales antes de tocar nada

Próximamente: firewall con ufw, fail2ban, deshabilitar servicios innecesarios, auditoría con Lynis.

## Cómo usarlo

Clona el repo y ejecútalo como root. Recomiendo probarlo primero en una máquina virtual.

```bash
git clone https://github.com/Iphone17pro/Secure-Linux.git
cd Secure-Linux
sudo bash securing.sh
```

Importante: ejecuta el script desde la carpeta raíz del proyecto, si no no encuentra los ficheros de configuración.

## Aviso

Modifica configuraciones del sistema. Haz un snapshot antes de ejecutarlo
en una máquina que te importe.
