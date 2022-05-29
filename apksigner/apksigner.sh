#!/bin/bash
figlet -f small APKSIGNER
echo "       PASSWORD KEYSTORE : bypassAV"
echo ""
echo ""
sleep 0.5
read -p "[+] APK PATH : " apkpath
echo ""
read -p "[+] APK OUTPUT NAME : " name
echo ""
echo "-------------------------------------------------"
echo ""
sleep 1

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore key.keystore $apkpath hacked > logs.txt

echo ""
echo "[*] Signing Apk ..."
echo ""

jarsigner -verify -verbose -certs $apkpath >> logs.txt

zipalign -v 4 $apkpath $name.apk >> logs.txt

rm -rf logs.txt

rm -rf $apkpath

echo "[+] Apk Saved in --> : $PWD/$name.apk"
echo ""
echo "[*] Closing APKSIGNER ..."
echo""
sleep 1
exit
