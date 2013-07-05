export LD_LIBRARY_PATH := $(shell pwd)
export GI_TYPELIB_PATH := $(shell pwd)

all: libobject.so ValaObject-0.1.typelib c-source

run: all run-own

run-own: all run-own-ruby run-own-python run-own-php run-own-lua run-own-gnome-js run-own-node-js

run-own-ruby: all
	-ruby own-bindings/ruby/test.rb

run-own-python: all
	-python own-bindings/python/test.py

run-own-php: all
	-php own-bindings/php/test.php

run-own-perl: all
	-perl own-bindings/perl/test.pl

run-own-lua: all
	-lua own-bindings/lua/test.lua
	-luajit-2.0.0-beta9 own-bindings/lua/test.lua

run-own-gnome-js: all
	-gjs own-bindings/javascript/test.gnome.js
	-seed own-bindings/javascript/test.gnome.js

run-own-node-js: all
	-node own-bindings/javascript/test.node.js

run-swig-ruby: all
	-ruby swig/ruby/test.rb 	# TODO

run-swig-python: all
	-python swig/python/test.py 	# TODO

run-swig-php: all
	-php swig/php/test.php 	# TODO

run-swig-perl: all
	-perl swig/perl/test.pl 	# TODO

run-swig-lua: all
	-lua swig/lua/test.lua 	# TODO

run-swig-gnome-js: all
	-gjs swig/javascript/test.gnome.js 	# TODO
	-seed swig/javascript/test.gnome.js 	# TODO

run-swig-node-js: all
	-node swig/javascript/test.node.js 	# TODO

php-swig: libobject.so c-source
	valabind-cc php object -NValaObject libobject.vapi -I. `php-config --includes` `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

c-source:
	valac -H object.h -C --vapi=object.vapi --library=libobject object.vala

libobject.so:
	valac \
		--enable-experimental    \
		-X -fPIC -X -shared      \
		--library=libobject    \
		--gir=ValaObject-0.1.gir \
		-o libobject.so        \
		object.vala

ValaObject-0.1.typelib:
	g-ir-compiler \
		--shared-library=libobject.so \
		--output=ValaObject-0.1.typelib \
		ValaObject-0.1.gir

clean:
	rm -fr $(shell cat .gitignore)
