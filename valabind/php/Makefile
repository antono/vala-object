export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`
PHP_HEADERS=`php-config --includes`

run:
	php test.php

bind: c-source libobject.so
	valabind-cc php object -NValaObject ../../object.vapi -I. -I../../ $(PHP_HEADERS) $(GOBJECT_HEADERS) -I/usr/include -L../.. -lobject -x

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

clean:
	rm -fr *.typelib *.so *.gir *.vapi *.c *.h *.i *.cxx object.php