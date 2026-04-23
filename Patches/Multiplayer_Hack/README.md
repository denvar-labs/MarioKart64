# Mario Kart 64 Netplay Hack (RMG-K Edition)

This project is a fork of the excellent work by [FraySSB](https://github.com/FraySSB/MarioKart64) (which itself is based on abitalive's multiplayer hack), optimized for stable online multiplayer with the **RMG-K** emulator.

## ✨ Features & Changes

### 🏎️ Character Stats
* Reorganized and expanded with four options:
    * `default` – Original game stats.
    * `all yoshi` – All characters use Yoshi's stats.
    * `all wario` – All characters use Wario's stats.
    * `more warios` – Yoshi, Toad, Peach, and Bowser use Wario's stats; others keep their own.

### 🌐 Track Rules (KA/VA)
* `KA Rules` – Original track order (Mushroom → Flower → Star → Special).
* `VA Rules` – Custom tournament order: (Mushroom → Special → Star → Flower).

### ⚙️ Menu & Gameplay Options
* **Game Pacing (Scaling):** `default`, `30 fps`, `60 fps` (moved to top of menu).
* **Widescreen:** Toggle on/off.
* **Trophies:** Option to skip the ceremony.
* **Multiplayer Music:** Force enabled.
* **Multiplayer Train/Boat:** Enable full train or boat in DKJP.
* **VS Bomb Karts:** Option to disable.
* **VS Tracks:** Force all cups in Versus mode.
* **VS Timer:** Enable countdown.
* **Gold Mushroom:** `default`, `feather small`, `feather big`.
* **Items:** Assign specific items to Player 1–8.
* **VS Scores:** Display scores on-screen.
* **Polling Rate Fix:** Forces 30Hz input polling to reduce lag on Kaillera servers.

### 🛠️ Optimizations & Fixes
* **Lag Fix Removed:** The old "Lag Fix" patch was known to break on console and cause audio issues with 60 FPS. It is unnecessary for RMG-K and has been completely removed.
* **RMG-K Netplay Optimized:** Configured to force `CountPerOp=1` via `mupen64plus.ini`, preventing desyncs in online play. Add this to your RMG-K ROM settings:

[89389AA3A32D7CF71455D093C8C8FCD4]
GoodName=Mario Kart 64 RMGK Netplay v1
CRC=A34EFD8D E1F4F066
RefMD5=89389AA3A32D7CF71455D093C8C8FCD4
CountPerOp=1

### ⚖️ Default Settings
To ensure a consistent and fair starting point for netplay, the default settings are:
* `stats` : `default`
* `scaling` : `30 fps`
* `tracks` : `KA Rules`
* `widescreen` : `default`
* `trophies` : `skip`
* `mp music` : `enabled`
* `vs bombs` : `disabled`

## How to Build
1. Clone this repository.
2. Place a clean **"Mario Kart 64 (U) [!].z64"** ROM in the `LIB/` folder.
3. Assemble with **bass**:  
 `bass Patches/Multiplayer_Hack/mk64_multiplayer_hack.asm`

## Credits
* **FraySSB** & **abitalive** – Original multiplayer hacks.
* **Jay-Day** – RMG-K emulator and netplay guidance.
- Download and extract [these files](https://drive.google.com/file/d/0B1g_ALmgbOzxSDdWVVA4TXdwWlk/view?usp=sharing) to the Multiplayer_Hack directory
- Drag and drop mk64_multiplayer_hack.asm onto asm.cmd

# Acknowledgements
- Special thanks to leodexe for compiling the [documentation](https://pastebin.com/D7J2L5yu) I used for this build
