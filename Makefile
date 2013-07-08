export LD_LIBRARY_PATH := $(shell pwd)
export GI_TYPELIB_PATH := $(shell pwd)

RUBY1.8_HEADERS=-I/usr/lib/ruby/1.8/x86_64-linux/ -I/usr/lib/ruby/1.8/i686-linux/
RUBY1.9.1_HEADERS=-I/usr/lib/ruby/1.9.1/x86_64-linux/ -I/usr/lib/ruby/1.9.1/i686-linux/
PHP_HEADERS=`php-config --includes`

all: libobject.so ValaObject-0.1.typelib c-source

run: run-gir

run-gir: run-gir-ruby run-gir-python run-gir-php run-gir-lua run-gir-gnome-js run-gir-nodejs

run-valabind: run-valabind-ruby run-valabind-python run-valabind-php run-valabind-lua run-gir-nodejs

########## test gir bingings ########## 

run-ruby-gir:
	-ruby gir/ruby/test.rb

run-python-gir:
	-python gir/python/test.py

run-php-gir:
	-php gir/php/test.php

run-perl-gir:
	-perl gir/perl/test.pl

run-lua-gir:
	-lua gir/lua/test.lua
	-luajit-2.0.0-beta9 gir/lua/test.lua

run-gnome-js:
	-gjs gir/javascript/test.gnome.js
	-seed gir/javascript/test.gnome.js

run-nodejs-gir:
	-node gir/javascript/test.node.js

########## test generated bindings with Valabind and valabind ########## 

# TODO
run-ruby-valabind:
	-make run -C valabind/ruby

# TODO
run-python-valabind:
	-python valabind/python/test.py

run-php-valabind:
	-make run -C valabind/php

# TODO
run-perl-valabind:
	-perl valabind/perl/test.pl

# TODO
run-lua-valabind:
	-lua valabind/lua/test.lua

run-nodejs-valabind:
	-make run -C valabind/javascript

########## generate bindings with Valabind ########## 

# TODO
ruby-valabind: libobject.so c-source
	-make bind -C valabind/ruby

# TODO
python-valabind: libobject.so c-source
	valabind-cc python pythonobject -NValaObject libobject.vapi -I. `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

php-valabind:
	-make bind -C valabind/php

# TODO
perl-valabind: libobject.so c-source
	valabind-cc perl perlobject -NValaObject libobject.vapi -I. `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

# TODO
lua-valabind: libobject.so c-source
	valabind-cc lua luaobject -NValaObject libobject.vapi -I. `pkg-config --cflags --libs gobject-2.0` -I/usr/include -L. -lobject -x

nodejs-valabind:
	-make bind -C valabind/javascript

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
	make clean -C valabind/javascript
	make clean -C valabind/php
	make clean -C valabind/ruby
