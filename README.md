# EdgeTX-Voiced-TXBattery

This is a small Lua script for EdgeTX that speaks the transmitter battery level as a percentage.

## Installation

1. Download or clone this repository, then connect your transmitter's SD card to your computer (or access it using USB mass-storage mode).
2. Copy `SCRIPTS/FUNCTIONS/txbatpc.lua` to the same folder on the SD card, so the final path is:
   `SCRIPTS/FUNCTIONS/txbatpc.lua`
3. Copy the `SOUNDS/en/SCRIPTS/TXBATPC` folder from this repository into the matching location on the SD card. The sound files should end up under:
   `SOUNDS/en/SCRIPTS/TXBATPC/`
   Keep the folder structure and file names intact. The audio files are used for the spoken battery prompt and low-battery warning.
4. Safely eject the SD card (if applicable) and restart the transmitter or refresh its SD card contents.
5. In your model's **Special Functions** settings, add a function that runs the `txbatpc` Lua script. Choose the switch and repeat/trigger behavior you want for battery announcements.

## How it works

When triggered, the script reads the transmitter battery voltage and uses the radio's configured battery minimum and maximum voltage settings to calculate a percentage. It rounds and limits the result to 0–100%, speaks the percentage, and plays a low-battery warning below 10%. If voltage is unavailable, it plays an unavailable prompt.

## Troubleshooting missing voice files

- Confirm the sound files are on the SD card under `SOUNDS/en/SCRIPTS/TXBATPC/` and that the folder and filenames are unchanged.
- The script first checks the folder for the radio's configured voice language. If a sound file is not found there, it falls back to the English file in `SOUNDS/en/SCRIPTS/TXBATPC/`.
- The script can still speak the percentage using EdgeTX's `playNumber`; the custom prompts and low-battery warning require their corresponding WAV files.
