# for_psd844
https://github.com/Hondanx/for_psd844.git
# VMware Workstation Virtual Machine Export and Network Configuration Guide

## Prerequisites
Before starting, ensure you have the following:
- **Ubuntu Server ISO** (for Linux VMs)
- **Windows 10 ISO** (for Windows VMs)
- **VMware Workstation 16 or above** (for better compatibility)

## Step 1: Configure VM Networks
Using VMware Workstation's **Virtual Network Editor**, create and configure the following VMnet adapters with these network IDs:

| VMnet | Network ID        |
|-------|------------------|
| VMnet2 | 192.168.56.0/24 |
| VMnet3 | 10.0.12.0/24    |
| VMnet4 | 10.0.13.0/24    |
| VMnet5 | 172.31.0.0/16   |
| VMnet6 | 172.16.0.0/16   |

## Step 2: Import VM Configurations
To simplify setup, import the VM configurations using the `.vmx` files provided in the attachments. Follow these steps:
1. **Open VMware Workstation**
2. **Go to File > Open**
3. **Select the .vmx file** for each VM and power them on

## Step 3: Enable IP Forwarding on Linux Machines
To allow packet forwarding between networks, enable IP forwarding on each Linux VM by running:
```bash
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
```

## Step 4: Configure Routing Tables
Each VM requires specific routing rules. Execute the provided routing scripts on their respective VMs:

- **On R1:**
  ```bash
  sudo bash r1-routing.sh
  ```
- **On R2:**
  ```bash
  sudo bash r2-routing.sh
  ```
- **On R3:**
  ```bash
  sudo bash r3-routing.sh
  ```

## Step 5: Deploy HTTP Server on Ubuntu
To set up a web server on the Ubuntu VM, install Apache by running:
```bash
sudo apt install apache2 -y
```
This will expose an HTTP web page on `172.16.0.1:80`.

## Step 6: Connectivity Testing
To verify network connectivity, use the following commands from a client in the `192.168.56.0/24` network:

- **Ping the HTTP server:**
  ```bash
  ping 172.16.0.1
  ```
- **Trace the route to the HTTP server:**
  ```bash
  tracert 172.16.0.1  # On Windows
  traceroute 172.16.0.1  # On Linux
  ```

## Conclusion
Following these steps, you will have a configured VMware environment with network segmentation, routing, and an accessible HTTP server. If you encounter issues, verify network configurations and firewall rules.

