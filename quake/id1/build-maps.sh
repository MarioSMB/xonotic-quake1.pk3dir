#!/bin/bash
# build-map.sh
compile_map() {
    # qbsp wants to see its precious quake directory
    ../../quake/id1/qbsp/qbsp ../../quake/id1/$1
    ../../quake/id1/qbsp/vis ../../quake/id1/$1
    ../../quake/id1/qbsp/light ../../quake/id1/$1
}
copy_map() {
	cp $1 ../../maps/
}
build_single() {
    echo "[ COMPILING ] Single map: $2"
    compile_map "maps/"$1".map"
    echo "[ COPYING ] Single map: $2"
    copy_map "maps/"$1".map"
}
build_all() {
    echo "[ COMPILING ] All maps";
    for m in $(ls maps/*.map | grep -v ".autosave"); do
        compile_map $m
    done
    echo "[ COPYING ] All maps";
    for m in $(ls maps/*.bsp); do
        copy_map $m
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
