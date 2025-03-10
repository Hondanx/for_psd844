#!/bin/bash

# R1 Routing table

# Add route for 172.16.0.0/16 via 10.0.12.2 on interface ens35
ip route add 172.16.0.0/16 via 10.0.12.2 dev ens35

# Add route for 172.31.0.0/16 via 10.0.13.2 on interface ens36
ip route add 172.31.0.0/16 via 10.0.13.2 dev ens36

