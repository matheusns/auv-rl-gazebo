#!/bin/bash

for i in {11..30}; do
    directory="apriltag_${i}"
    file="fiducials.material"

    # Append text to model.sdf file
    echo "\n
material AprilTag/id_${i}
{
  technique
  {
    pass
    {
      ambient 1 1 1 1
      diffuse 1 1 1 1
      specular 0 0 0 0

      texture_unit
      {
        texture ../textures/tag41_12_000${i}.png
        filtering bilinear
        max_anisotropy 16
      }
    }
  }
}" >> "$file"

    echo "Appended text for apriltag_${i}"
done
