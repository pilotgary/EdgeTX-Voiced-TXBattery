I have created AI-based translations of this document for 🇩🇪&nbsp;**[Deutsch](README.de.md)** · 🇪🇸&nbsp;**[Español](README.es.md)** · 🇫🇷&nbsp;**[Français](README.fr.md)**. I'm happy to amend these to fix any errors.

# EdgeTX-Voiced-TXBattery

This is a small Lua script for EdgeTX that speaks the transmitter battery level as a percentage.  

It came about after I'd been doing a lot of bench testing for an iNav setup and then had the low battery alarm go off during the first flight. 

I like to have it triggered on disarm, so that at the end of the flight, I know how much battery is available for the next one. This also gives a report when the transmitter is powered on.

## How it works

When triggered, the script reads the transmitter battery voltage and uses the radio's configured battery minimum and maximum voltage settings to calculate a percentage. It rounds and limits the result to 0–100%, speaks the percentage, and plays a low-battery warning below 10%. If voltage is unavailable, it plays an unavailable prompt.

## Installation

1. Download or clone this repository, then connect your transmitter's SD card to your computer (or access it using USB mass-storage mode).
2. Copy `SCRIPTS/FUNCTIONS/txbatpc.lua` to the same folder on the SD card, so the final path is:
   `SCRIPTS/FUNCTIONS/txbatpc.lua`
3. Copy the `SOUNDS/en/SCRIPTS/TXBATPC` folder from this repository into the matching location on the SD card. The sound files should end up under:
   `SOUNDS/en/SCRIPTS/TXBATPC/`
   Keep the folder structure and file names intact. The audio files are used for the spoken battery prompt and low-battery warning.
4. Safely eject the SD card (if applicable) and restart the transmitter or refresh its SD card contents.
5. In your model's **Special Functions** settings, add a function that runs the `txbatpc` Lua script. Choose the switch/position, set the repeat/trigger behavior to x1 and check the activate box.

**NOTE: If the sound files start playing in a loop when activated, power cycle the transmitter and it should work fine from then on**

## Alternative voice files

The included sound files are English using the Emily (Ireland) voice with a 20% speedup.  This was chosen as the best match for the EdgeTX supplied sound files.  If you would like to create alternatives, I would recommend using Vox-Pack (https://github.com/ritchy-lab/Vox-Pack) 🇬🇧&nbsp;**[English&nbsp;version](https://github.com/ritchy-lab/Vox-Pack/blob/main/README.en.md)** · 🇫🇷 **[Version française](https://github.com/ritchy-lab/Vox-Pack/blob/main/README.md)** . 🇩🇪&nbsp;**[Deutsche&nbsp;Fassung](https://github.com/ritchy-lab/Vox-Pack/blob/main/README.de.md)**

### English

To create new voice files.

1. Import the "en.csv" file in the csv folder into Vox-Pack by clicking the menu icon in the top left and then "Import a list..."
<img width="813" height="434" alt="Vox-Pack" src="https://github.com/user-attachments/assets/0e8a5013-8ad3-41cd-adcb-1e4573ca5986" />

2. Select the new voice and speed
3. Click the Let's Go button and select the target folder

The three voice files will be generated in the folder you specify.  Copy them to the SOUNDS/en/SCRIPTS/TXBATPC/ folder on your radio.

### Other languages

I have used AI to generate translations for French, German and Spanish.  These are contained in the relevant paths in the SOUNDS folder.  I cannot vouch for the quality of the translations so please raise an issue with a better translation, preferred voice or speed.

To create sound files in a different language
1. save the en.csv to the new country code. E.g. Fr.csv for French.
2. Edit the new file and replace the text strings with the desired translations.  Do not edit the filenames.
3. Import the new csv file into Vox-Pack
4. Pick the new voice and speed
5. Click the Let's Go button and select the target folder.
6. Copy the new wav files to the SOUNDS/<Your language code>/SCRIPTS/TXBATPC/ folder on your radio.

## Troubleshooting missing voice files

- Confirm the sound files are on the SD card under `SOUNDS/en/SCRIPTS/TXBATPC/` and that the folder and filenames are unchanged.
- The script first checks the folder for the radio's configured voice language. If a sound file is not found there, it falls back to the English file in `SOUNDS/en/SCRIPTS/TXBATPC/`.
- The script can still speak the percentage using EdgeTX's `playNumber`; the custom prompts and low-battery warning require their corresponding WAV files.
