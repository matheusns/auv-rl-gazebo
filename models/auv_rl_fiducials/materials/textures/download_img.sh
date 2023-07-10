#!/bin/bash

base_url="https://github.com/AprilRobotics/apriltag-imgs/raw/master/tagStandard41h12/tag41_12_"
coverter_script="converter_png_unique.py"
wget -O "$coverter_script" https://raw.githubusercontent.com/AprilRobotics/apriltag-imgs/master/tag_to_svg.py



for i in {11..30}; do
    image_url="${base_url}$(printf "%05d" "$i").png"
    wget "$image_url"
    echo "Downloaded image ${i}"

    input_image="tag41_12_$(printf "%05d" "$i").png"
    output_svg="tag41_12_$(printf "%05d" "$i").svg"

    python3 "$coverter_script" "$input_image" "$output_svg" --size=250mm
    echo "Converted image ${i} to SVG"
    rm "$input_image"
done

rm "$coverter_script"
