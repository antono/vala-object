# Use Vala for your next library, %username%

![Objects for free](https://github.com/antono/vala-object/raw/master/objects.jpg)

Write your next library in [Vala][Vala] and get some bindings for free.
Here is example how to get functions from shared object available to
Ruby, Python, Lua, JavaScript and [many other languages][GOB]

Vala is [very fast][VBench] and managed language.

## Vala setup

### Debian/Ubuntu

    sudo apt-get install valac gobject-introspection \
         libffi-dev glib-dev libglib2.0-dev
    make
    make run # setup for your favorite lang below

### OSX

    sudo apt-get^W brew install vala
    make
    make run # setup for your favorite lang below

Feel free to add your instructions... I've donated my mac to charity :)

## Ruby

    gem install ruby gir_ffi

## Python

    nothing on ubuntu

## Lua

    sudo apt-get install lua5.1 luarocks

## JavaScript

    sudo apt-get install gjs seed

## Other languages

- https://live.gnome.org/GObjectIntrospection/Users

[Vala]: https://live.gnome.org/Vala/
[VBench]: http://code.google.com/p/vala-benchmarks/wiki/BenchResults
[GOB]: https://live.gnome.org/GObjectIntrospection/Users
