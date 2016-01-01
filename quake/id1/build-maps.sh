#!/bin/bash
# build-map.sh
compile_map() {
    # qbsp wants to see its precious quake directory
    ./qbsp/qbsp ../../quake/id1/$1
    ./qbsp/vis ../../quake/id1/$1
    ./qbsp/light ../../quake/id1/$1
}
move_map() {
	mv $1 ../../maps/
}
build_single() {
    echo "[ COMPILING ] Single map: $1"
    compile_map "maps/"$1".map"
    echo "[ MOVING ] Single map: $1"
    move_map "maps/"$1".bsp"
}
build_all() {
    echo "[ COMPILING ] All maps";
    for m in $(ls maps/*.map | grep -v ".autosave"); do
        compile_map $m
    done
    echo "[ MOVING ] All maps";
    for m in $(ls maps/*.bsp); do
        move_map $m
    done
}
delete_bsps() {
    echo "[ REMOVING ] Deleting old BSP files"
    find maps -name *.bsp -exec rm -vf {} \;
}
help() {
    echo "Please check the README or try building all maps with: ./build-maps.sh -a"
}

case $1 in
  --single|-s) build_single $2;;
  --all|-a)    build_all;;
  --delete|-d) delete_bsps;;
  *)           help;;
esac
