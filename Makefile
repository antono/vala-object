export LD_LIBRARY_PATH := $(shell pwd)
export GI_TYPELIB_PATH := $(shell pwd)

all: vala-object.so ValaObject-0.1.typelib

run: all run-ruby run-python run-lua run-js

run-ruby: all
	ruby langs/ruby/test.rb

run-python: all
	python langs/python/test.py

run-lua: all
	lua langs/lua/test.lua
	luajit-2.0.0-beta8 langs/lua/test.lua

run-gnome-js: all
	gjs langs/javascript/test.gnome.js
	seed langs/javascript/test.gnome.js

run-node-js: all
	cd langs/javascript && npm install && node test.node.js

vala-object.so:
	valac \
		--enable-experimental    \
		-X -fPIC -X -shared      \
		--library=vala-object    \
		--gir=ValaObject-0.1.gir \
		-o vala-object.so        \
		object.vala

ValaObject-0.1.typelib:
	g-ir-compiler \
		--shared-library=vala-object.so \
		--output=ValaObject-0.1.typelib \
		ValaObject-0.1.gir

clean:
	rm -fr $(shell cat .gitignore)
