#!/bin/bash

#sudo rm -rf rtlwifi_new
sudo rm /etc/modprobe.d/rtl8723de.conf
#git clone https://github.com/lwfinger/rtlwifi_new.git
cd rtlwifi_new/ #&& git checkout origin/extended -b extended
sudo make install
sudo modprobe -r rtl8723de
sudo modprobe rtl8723de
sudo modprobe -r rtl8723de && sleep 5 && sudo modprobe rtl8723de ant_sel=2
echo "options rtl8723de ant_sel=X" | sudo tee /etc/modprobe.d/rtl8723de.conf
