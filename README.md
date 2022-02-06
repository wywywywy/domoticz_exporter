Domoticz exporter for Prometheus.io, written in Node.js 14.

This exporter provides metrics for the devices defined in Domoticz, rather than for Domoticz itself.

# Usage

## Arguments

    --port     9486         Exporter listens on this port (default = 9486)
    --interval 15           Polling interval in seconds (default = 15, minimum 2)
    --hostip   127.0.0.1    Domoticz IP (default = 127.0.0.1)
    --hostport 8080         Domoticz port (default = 8080, or 443 if using SSL)
    --hostssl               Use SSL to connect to Domoticz
    --collectdefault        Collect default Prometheus metrics as well (default = false)

## Environment Variables

The arguments can also be set as env variables instead. Useful if you're using it in a Docker container.
1. DOMOTICZ_PORT
2. DOMOTICZ_INTERVAL
3. DOMOTICZ_HOSTIP
4. DOMOTICZ_HOSTPORT
5. DOMOTICZ_HOSTSSL
6. DOMOTICZ_DEFAULTMETRICS

# Installation

## From Source

Node 14 is required to run it.

    git clone git@github.com:wywywywy/domoticz_exporter.git
    cd domoticz_exporter
    npm install
    npm start

Recommend npm version >= 6.

## With Docker

    docker run -d --restart=always -p 9486:9486 wywywywy/domoticz_exporter:latest

## Prometheus Config

Add this to prometheus.yml and change the IP/port if needed.

    - job_name: 'domoticz_exporter'
        metrics_path: /
        static_configs:
        - targets:
            - '127.0.0.1:9486'

# Notes on Devices

There are 4 types of devices in Domoticz, and they are presented as separate metric groups.

1. light = Get all lights/switches
2. weather = Get all weather devices
3. temp = Get all temperature devices
4. utility = Get all utility devices

Unfortunately there is no standard in Domoticz how "levels" are presented.  So for example on some devices battery level 100 means full, and others it will be 255.

The same goes for units - on some it may be Celsius others Fahrenheit, some it may be kWh others Ah, etc.  It all depends on the device itself.

# TODO

1. Support for more edge-case devices
2. Metrics of Domoticz itself maybe?

# Contributing

Yes, contributions are always welcome.  
Fork it, clone it, submit a pull request, etc.

# License

This is licensed under the Apache License 2.0.
