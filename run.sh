#!/bin/sh

AUDIO_FILE=$1
SEGMENT_FORMAT=$2 # aac mpgets
CONVERT=$3 #Y or N
#CODEC="aac" libfdk_aac

if [ "$CONVERT" = "Y" ]; then
    rm -r ./out
    mkdir ./out
    ffmpeg -i $AUDIO_FILE -vn -ac 2 -acodec aac -f segment -segment_format $SEGMENT_FORMAT -segment_time 5 -segment_list out/out.m3u8 out/out%05d.aac
fi;

python3 server.py -l out.m3u8

