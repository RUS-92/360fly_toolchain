# 360fly_toolchain
Use FFMPEG to Automate Equirectangular Conversion of 360Fly or 360Fly 4K Video Clips, while maintaining high-quality, high bitrate

## Motivation
My laptop is perhaps not amazing, and for whatever reason, 360Fly Director only wants to convert short videos. Long ones simply do not work. Luckily, the camera has a 4 minute video chaptering feature. Sadly, Director does not have any batch processing features. If it takes 8 minutes to convert a 4 minute video and I shoot 1 hour and 20 minutes of video, I have 2 hours and 40 minutes of sitting in front of the computer mostly waiting and occasionally pushing a couple buttons. This is extremely boring and I would like to go to bed!

Thanks to https://github.com/prouast/equirectangular-remap I was inspired to develop a command-line solution based on FFMPEG. This is the result.

## Instructions
1.Install FFMPEG:
sudo apt install ffmpeg

2. Install Python3:
sudo apt update && sudo apt upgrade

sudo apt install python3
sudo apt install python-is-python3

3.(optional) 360Fly 4K files might need to be rotated 270 degrees. The below command will losslessly rotate the video (might take some minutes to process):
exiftool -rotation=270 FILE.mp4

4. Place Video files in the same directory as the script. Run the script:
./processing_script.sh

Fully processed files will be placed in the equirectangular>ready_for_davinci>blindspotted directory.The files will say "injected" on them.

## Caveats and TODO's
There are lots. Firstly, I am not responsible for your use of this script. If you lose your footage, that's your business. Don't complain to me, etc.

The blindspot size was found via trial and error. I do not have good math for it, nor did I do an especially precise job of measuring the one that 360Fly Director inserts.

I did not develop a map and a script for all the resolutions that 360Fly Director has. I only need the big one.

There are random, rambling notes in here that I made to preserve my sanity while I figured this out. I know nothing about video processing.
