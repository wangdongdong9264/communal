# RAM of PC

Is it really that hard to fill all four slots ?  128GB or more

Yes! you can't keep those four sticks stable at high speeds.

Because 128GB is a massive amount of memory for a consumer CPU to handle, you should follow this specific order of operations to ensure your computer actually works and doesn't crash.

## Hard info

CPU: 13th i9-13900

Motherboard: z790 AERO G

Memory: DDR5 6400

## how to do

### step 1

Update your BIOS

Before you do anything else, update your motherboard BIOS to the latest version. Manufacturers have been releasing "Stability Improvements for High-Capacity Memory" updates constantly. A BIOS update can be the difference between your PC booting at 4800MT/s or not booting at all.

### step 2

Do NOT enable XMP/EXPO

* Let the motherboard boot using the JEDEC (Default) speeds. These are usually slow (e.g., 4000MT/s or 4800MT/s), but they are the most stable.
* Once you are in Windows, check if the system is stable. If it boots and runs fine, you have a baseline.

### setp 3

Attempting XMP/EXPO

If you want the speeds you paid for (e.g., 5600 or 6000MT/s), you can try enabling XMP/EXPO

If it fails to boot, accept a slower speed, e.g. 4000MT/s

### setp 4

Stress Test

Once you get into Windows, you must test the RAM. Because you have 128GB, a small error can happen once every hour and cause a crash.

* Download a tool like TestMem5
* least 1 hour or more
