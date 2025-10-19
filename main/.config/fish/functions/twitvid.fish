function twitvid
    ffmpeg -i "$argv[1]" \
        -vcodec libx264 -pix_fmt yuv420p -strict experimental \
        -r 30 -t 2:20 \
        -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -vb 1024k \
        -acodec aac -ar 44100 -ac 2\
        -minrate 1024k \
        -movflags +faststart \
        "$argv[1]_twitter.mp4"
end
