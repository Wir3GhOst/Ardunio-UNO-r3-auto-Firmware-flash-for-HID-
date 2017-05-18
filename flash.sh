#!bin/bash
if [ -d "firmwares" ];
then
    echo
else
    echo "Directory not found"
    sleep 3
    echo "Creating new Directory"
    sleep 2
    mkdir firmwares
    cd firmwares
    echo "Downloading the Hex files"
    sleep 1
    wget https://raw.githubusercontent.com/arduino/Arduino/master/hardware/arduino/avr/firmwares/atmegaxxu2/arduino-usbserial/Arduino-usbserial-atmega16u2-Uno-Rev3.hex
    sleep 1
    wget https://raw.githubusercontent.com/coopermaa/USBKeyboard/master/firmware/Arduino-keyboard-0.3.hex
    sleep 3
    clear
    cd ..
fi
echo "Connect Arduino and short the ICSP pin to GND and press Enter"
read
dfu-programmer atmega16u2 erase
dfu-programmer atmega16u2 flash --suppress-bootloader-mem firmwares/Arduino-usbserial-atmega16u2-Uno-Rev3.hex
dfu-programmer atmega16u2 reset
echo
echo "Disconnect the Arduino"
read
echo "Open the IDE and compile your Codes"
read
echo "Connect Arduino and short the pins again"
read
dfu-programmer atmega16u2 erase
dfu-programmer atmega16u2 flash firmwares/Arduino-keyboard-0.3.hex
dfu-programmer atmega16u2 reset
echo
echo "Done"
