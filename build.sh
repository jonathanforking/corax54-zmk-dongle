#!/bin/bash

PWD=$(pwd)
TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M")}"

west build -s zmk/app -p -b nice_nano_v2 -- -DSHIELD="corax_left" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_left.uf2"

west build -s zmk/app -p -b nice_nano_v2 -- -DSHIELD="corax_right" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_right.uf2"

west build -s zmk/app -p -b seeeduino_xiao_ble -- -DSHIELD="corax_dongle" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_dongle.uf2"
