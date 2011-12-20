export LD_LIBRARY_PATH := $(shell pwd)
export GI_TYPELIB_PATH := $(shell pwd)

all: vala-object.so ValaObject-0.1.typelib

run: all run-ruby run-python run-lua run-js

run-ruby:
        ruby langs/test.rb
run-python:
        python langs/test.py
run-lua:
        lua langs/test.lua
run-js:
        gjs langs/test.js
        seed langs/test.js

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
	rm $(shell cat .gitignore)
