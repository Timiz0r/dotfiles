function mamu
    ascii-image-converter -C -W 60 ~/OneDrive/Pictures/avs/mamu_modu.png | awk '{ system("sleep 0.05") ; print}'
end
