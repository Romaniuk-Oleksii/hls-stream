#!/bin/sh

AUDIO_FILE=$1
SEGMENT_FORMAT=$2 # aac mpgets
CONVERT=$3 #Y or N
M3U8_FILE=$4
#CODEC="aac" libfdk_aac

if [ "$CONVERT" = "Y" ]; then
    rm -r ./out
    mkdir ./out

    #if [ "$M3U8_FILE" = "audio.aac" ]; then
        ffmpeg -i $AUDIO_FILE -vn -ac 2 -acodec aac -f segment -segment_format $SEGMENT_FORMAT -segment_time 5 -segment_list out/out.m3u8 out/out%05d.aac
    #else
    #    ffmpeg -i $AUDIO_FILE -vn -ac 2 -c:v libx264 -acodec aac -f segment -segment_format $SEGMENT_FORMAT -segment_time 5 -segment_list out/out.m3u8 out/out%05d.aac
    #fi;
        
fi;

python3 server.py -l $M3U8_FILE

