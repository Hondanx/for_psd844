Guía de Exportación de Máquinas Virtuales y Configuración de Red en VMware Workstation
Requisitos Previos

Antes de comenzar, asegúrate de tener lo siguiente:

    ISO de Ubuntu Server (para máquinas virtuales Linux)
    ISO de Windows 10 (para máquinas virtuales Windows)
    VMware Workstation 16 o superior (para mejor compatibilidad)

Paso 1: Configurar Redes de las Máquinas Virtuales

Usando el Editor de Redes Virtuales de VMware Workstation, crea y configura los siguientes adaptadores VMnet con estas IDs de red:
VMnet	ID de Red
VMnet2	192.168.56.0/24
VMnet3	10.0.12.0/24
VMnet4	10.0.13.0/24
VMnet5	172.31.0.0/16
VMnet6	172.16.0.0/16
Paso 2: Importar Configuraciones de las Máquinas Virtuales

Para simplificar la configuración, importa las configuraciones de las máquinas virtuales usando los archivos .vmx proporcionados en los archivos adjuntos. Sigue estos pasos:

    Abrir VMware Workstation
    Ir a Archivo > Abrir
    Seleccionar el archivo .vmx de cada máquina virtual y encenderlas

Paso 3: Habilitar el Reenvío de IP en Máquinas Linux

Para permitir el reenvío de paquetes entre redes, habilita el reenvío de IP en cada máquina Linux ejecutando:

echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

Paso 4: Configurar las Tablas de Enrutamiento

Cada máquina virtual necesita reglas de enrutamiento específicas. Ejecuta los scripts de enrutamiento proporcionados en sus respectivas máquinas virtuales:

    En R1:

sudo bash r1-routing.sh

En R2:

sudo bash r2-routing.sh

En R3:

    sudo bash r3-routing.sh

Paso 5: Implementar un Servidor HTTP en Ubuntu

Para configurar un servidor web en la máquina virtual con Ubuntu, instala Apache ejecutando:

sudo apt install apache2 -y

Esto expondrá una página web HTTP en 172.16.0.1:80.
Paso 6: Pruebas de Conectividad

Para verificar la conectividad de red, usa los siguientes comandos desde un cliente en la red 192.168.56.0/24:

    Hacer ping al servidor HTTP:

ping 172.16.0.1

Rastrear la ruta hacia el servidor HTTP:

    tracert 172.16.0.1  # En Windows  
    traceroute 172.16.0.1  # En Linux  

Conclusión

Siguiendo estos pasos, tendrás un entorno VMware configurado con segmentación de red, enrutamiento y un servidor HTTP accesible. Si encuentras problemas, verifica las configuraciones de red y las reglas del firewall.
