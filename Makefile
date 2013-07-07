export LD_LIBRARY_PATH := $(shell pwd)
export GI_TYPELIB_PATH := $(shell pwd)

RUBY1.8_HEADERS=-I/usr/lib/ruby/1.8/x86_64-linux/ -I/usr/lib/ruby/1.8/i686-linux/
RUBY1.9.1_HEADERS=-I/usr/lib/ruby/1.9.1/x86_64-linux/ -I/usr/lib/ruby/1.9.1/i686-linux/
PHP_HEADERS=`php-config --includes`

all: libobject.so ValaObject-0.1.typelib c-source

run: run-gir

run-gir: run-gir-ruby run-gir-python run-gir-php run-gir-lua run-gir-gnome-js run-gir-nodejs

run-swig: run-swig-ruby run-swig-python run-swig-php run-swig-lua run-gir-nodejs

########## test gir bingings ########## 

run-gir-ruby:
	-ruby gir/ruby/test.rb

run-gir-python:
	-python gir/python/test.py

run-gir-php:
	-php gir/php/test.php

run-gir-perl:
	-perl gir/perl/test.pl

run-gir-lua:
	-lua gir/lua/test.lua
	-luajit-2.0.0-beta9 gir/lua/test.lua

run-gir-gnome-js:
	-gjs gir/javascript/test.gnome.js
	-seed gir/javascript/test.gnome.js

run-gir-nodejs:
	-node gir/javascript/test.node.js

########## test generated bindings with Valabind and Swig ########## 

# TODO
run-swig-ruby:
	-ruby1.8 swig/ruby/test1.8.rb
	-ruby1.9.1 swig/ruby/test1.9.1.rb

# TODO
run-swig-python:
	-python swig/python/test.py

run-swig-php:
	-make run -C swig/php

# TODO
run-swig-perl:
	-perl swig/perl/test.pl

# TODO
run-swig-lua:
	-lua swig/lua/test.lua

run-swig-nodejs:
	-make run -C swig/javascript

########## generate bindings with Valabind ########## 

# TODO
ruby-swig: libobject.so c-source
	-valabind-cc ruby rubyoneeightobject -NValaObject libobject.vapi -I. $(RUBY1.8_HEADERS) `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x
	valabind-cc ruby rubyonenineoneobject -NValaObject libobject.vapi -I. $(RUBY1.9.1_HEADERS) `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

# TODO
python-swig: libobject.so c-source
	valabind-cc python pythonobject -NValaObject libobject.vapi -I. `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

php-swig:
	-make bind -C swig/php

# TODO
perl-swig: libobject.so c-source
	valabind-cc perl perlobject -NValaObject libobject.vapi -I. `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

# TODO
lua-swig: libobject.so c-source
	valabind-cc lua luaobject -NValaObject libobject.vapi -I. `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

nodejs-swig:
	-make bind -C swig/javascript

########## Vala Stuff ##########

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

########## Other ##########

clean:
	rm -fr $(shell cat .gitignore)
	make clean -C swig/javascript
	make clean -C swig/php
