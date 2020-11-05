#!/bin/bash

cd /home/pi
if [ -d "/home/pi/.emulationstation/themes/SuperLopezGB/" ]; then
        echo "Super Lopez GB theme was downloaded yet"
        echo "Deleting and redownloading..."
        sleep 4
        sudo rm -r "/home/pi/.emulationstation/themes/SuperLopezGB/"
        sudo mkdir -p "/home/pi/.emulationstation/themes/SuperLopezGB/" && sudo git clone https://github.com/mlopezmad/SuperLopezGB "/home/pi/.emulationstation/themes/SuperLopezGB/"
        #cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        #sudo sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        #sudo sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        #sudo sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml
else
        echo "Downloading Super Lopez GB theme..."
        sleep 4
        sudo mkdir -p "/home/pi/.emulationstation/themes/SuperLopezGB/" && sudo git clone https://github.com/mlopezmad/SuperLopezGB "/home/pi/.emulationstation/themes/SuperLopezGB/"
        #cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        #sudo sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        #sudo sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        #sudo sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml
fi

#make temporal directory
cd /home/pi
if [ -d /home/pi/tmp ]; then
        sudo rm -R /home/pi/tmp
        mkdir /home/pi/tmp
else
        mkdir /home/pi/tmp
fi
#Download and install launching images
git clone https://github.com/mlopezmad/SuperLopezGB-Launching "/home/pi/tmp"
echo "COPYING LAUNCHING IMAGES..."
sleep 3
cp -R /home/pi/tmp/* /opt/retropie/configs
sudo rm -r tmp
#Change theme value on EmulationStation config file
#sed -i 's/.*<string name="ThemeSet" value=.*/<string name="ThemeSet" value="SuperLopezGB" /> \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
