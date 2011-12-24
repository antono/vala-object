# Use Vala for your next library, %username%

![Objects for free](https://github.com/antono/vala-object/raw/master/objects.jpg)

Write your next library in [Vala][Vala] and get some bindings for free.
Here is example how to get functions from shared object available to
Ruby, Python, Lua, JavaScript and [many other languages][GOB]

Vala is [very fast][VBench]. Keep in mind!

## Vala setup

### Debian/Ubuntu

    sudo apt-get install valac gobject-introspection libffi-dev libglib2.0-dev
    
See setup for your favorite lang below
    
### Fedora

    sudo yum install vala gobject-introspection-devel

### OSX

    brew install vala

Feel free to add OSX instructions... I've donated my mac to charity :)

## Ruby

    gem install ruby gir_ffi
    make run-ruby

## Python

[Detailed instructions](https://github.com/tliron/pygobject-example)
[Talk about PyGObject, GObject, Vala and more at the Chicago Python group](https://www.youtube.com/watch?v=6QrGmA_RR4E)

    make run-python

## Lua

    sudo apt-get install lua5.1 luarocks
    luarocks install lgi
    make run-lua

## JavaScript

### GNOME js engines have native GIR support

    sudo apt-get install gjs seed
    make run-gnome-js

### Node.js

You will need
[nvm](https://github.com/creationix/nvm) and
[npm](https://github.com/isaacs/npm)

    nvm install v0.6.6
    npm install gir
    make run-node-js

## Other languages

- https://live.gnome.org/GObjectIntrospection/Users

[Vala]: https://live.gnome.org/Vala/
[VBench]: http://code.google.com/p/vala-benchmarks/wiki/BenchResults
[GOB]: https://live.gnome.org/GObjectIntrospection/Users
