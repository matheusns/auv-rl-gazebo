#!/bin/bash

for i in {11..30}; do
    directory="april_tag_${i}"
    # Create model.sdf file
    model_sdf="${directory}/model.sdf"
    touch "$model_sdf"

    # Write content to model.sdf file
    echo "<?xml version="1.0" ?>
<sdf version="1.0">
  <model name=\"april_tag_${i}\">
    <static>true</static>
    <link name=\"april_tag_${i}\">
      <pose>0 0 0 0 0 0</pose>
      <inertial>
        <mass>0.0001</mass>
        <inertia>
          <ixx>0.00001</ixx>
          <iyy>0.00001</iyy>
          <izz>0.00001</izz>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyz>0</iyz>
          </inertia>
      </inertial>

      <collision name=\"april_tag_${i}\">
        <pose>0 0 0 0 0 0</pose>
        <geometry>
            <box>
            <size>0.25 0.25 0.001</size>
            </box>
        </geometry>
      </collision>

      <visual name=\"april_tag_${i}\">
        <pose>0 0 0 0 0 0</pose>
        <geometry>
          <box>
          <size>0.25 0.25 0.001</size>
          </box>
        </geometry>
        <material>
        <script>
          <uri>file://models/auv_rl_fiducials/materials/scripts/fiducials.material</uri>
          <name>AprilTag/id_${i}</name>
        </script>
        </material>
      </visual>
    </link>
  </model>
  </sdf>" > "$model_sdf"

    # Create model.config file
    model_config="${directory}/model.config"
    touch "$model_config"

    # Write content to model.config file
    echo "<?xml version="1.0"?>
<model>
  <name>april_tag_${i}</name>
  <version>1.0</version>
  <sdf version=\"1.5\">model.sdf</sdf>

  <author>
    <name>Matheus Nascimento</name>
    <email>contamatheusnascimento@gmail.com</email>
  </author>

  <description>
    April Tag Standard 41h12 #${i} (Reference: https://github.com/AprilRobotics/apriltag-imgs)
  </description>
</model>" > "$model_config"

    echo "Created files for apriltag_${i}"
done
