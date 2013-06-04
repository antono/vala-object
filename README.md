# Use Vala for your next library, %username%

![Objects for free](https://github.com/antono/vala-object/raw/master/objects.jpg)

Write your next library in [Vala][Vala] and get bindings for free!

Here is example how to use functions and objects from vala
in your favorite language.

## Why Vala?

 - Vala is [very][VBench] [fast][VBenchNew]
 - Vala manages memory for you
 - Write in Vala, (re)use from any
   [%lang%](https://live.gnome.org/GObjectIntrospection/Users)

## Setup Vala

### Debian/Ubuntu

    sudo apt-get install valac gobject-introspection libgirepository1.0-dev

### Fedora

    sudo yum install vala gobject-introspection-devel

### OSX

    brew install vala gobject-introspection

## Make shared library

Source file for shared library is `object.vala`.

Run in shell:

    make

You should get `vala-object.so` and `ValaObject-0.1.typelib` and
some other files. `.so` and `.typelib` are required for next examples.

If you want more details - read about
[GObject Introspection](https://live.gnome.org/GObjectIntrospection/) and it's
[architecture](https://live.gnome.org/GObjectIntrospection/Architecture).
Otherwise just skip to next step :)

## Bindings HOWTO (really easy and automagical)
 - [Ruby](langs/ruby/README.md) (Ruby 1.9.1, JRuby and Rubinius)
 - [Python](langs/python/README.md)
 - [Perl](langs/perl/README.md)
 - [Lua](langs/lua/README.md) (Lua 5.1 and LuaJIT 5.1)
 - [JavaScript](langs/javascript/README.md) (Node.js, seed and gjs)
 - [PHP](langs/php/README.md)
 - [Other languages](https://live.gnome.org/GObjectIntrospection/Users)

## Questions?

 - Mailing list: [vala](https://mail.gnome.org/mailman/listinfo/vala-list)
 - IRC: #introspection and #vala at irc.gnome.org
 - [Documentation](https://live.gnome.org/Vala/Documentation)
 - [Google+ page](https://plus.google.com/115393489934129239313/posts)

[Vala]: https://live.gnome.org/Vala/
[VBench]: http://code.google.com/p/vala-benchmarks/wiki/BenchResults
[VBenchNew]: http://jpaflacerda.wordpress.com/2011/11/08/vala-benchmarking/
