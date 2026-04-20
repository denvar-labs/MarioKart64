# Mario Kart 64 Netplay Hack (RMG-K Edition)

This project is a fork of the excellent work by [FraySSB](https://github.com/FraySSB/MarioKart64), optimized for use with the **RMG-K** emulator and focused on stable online multiplayer.

## ✨ Features

- **KA Rules**: Original track order (Mushroom → Flower → Star → Special).
- **VA Rules**: Custom track order for tournaments (LR → MMF → KTB → KD → DKJP → YV → BB → RRD → WS → SL → RRY → BC → TT → FS → CM → MR).
- **Lag Fix removed**: Unnecessary and counterproductive in RMG-K.
- **Netplay optimized**: Forces `CountPerOp=1` via `mupen64plus.ini` to prevent desyncs.
    [89389AA3A32D7CF71455D093C8C8FCD4]
    GoodName=Mario Kart 64 RMGK Netplay v1
    CRC=A34EFD8D E1F4F066
    RefMD5=89389AA3A32D7CF71455D093C8C8FCD4
    CountPerOp=1

## 📦 How to Use

1. Clone this repository.
2. Place a clean *Mario Kart 64 (U) [!].z64* ROM inside the `LIB/` folder.
3. Assemble with **bass**:
   ```bash
   bass Patches/Multiplayer_Hack/mk64_multiplayer_hack.asm

   ## Credits

   FraySSB – abitalive
   Jay-Day – RMG-K emulator and netplay improvements.
