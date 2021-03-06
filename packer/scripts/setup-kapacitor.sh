#!/usr/bin/env bash

set -euxo pipefail

curl -s "https://dl.influxdata.com/kapacitor/releases/kapacitor_$1_amd64.deb" --output "kapacitor_$1_amd64.deb"
sudo dpkg -i "kapacitor_$1_amd64.deb"
rm "kapacitor_$1_amd64.deb"
sudo systemctl stop kapacitor.service
sudo systemctl disable kapacitor.service
sudo mv /etc/kapacitor/kapacitor-monitor.conf /etc/kapacitor/kapacitor-monitor.conf
sudo chown -R kapacitor:kapacitor /etc/kapacitor/kapacitor.conf
