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

The script uses the transmitter's configured battery minimum and maximum voltage settings to calculate the percentage. It looks for audio in the configured voice-language folder and falls back to English when localized audio is unavailable.
