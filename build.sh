#! /bin/sh

OS="`uname`"
case $OS in
  'Linux')
    docker run --rm -it -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u $(id -u):$(id -g) -v ${PWD}:/mnt mrt-prodz/godot-gdextension-builder scons platform=linux -j4
    ;;
  *)
    winpty docker run --rm -it -v /$(pwd):/mnt mrt-prodz/godot-gdextension-builder scons platform=windows -j4
    ;;
esac