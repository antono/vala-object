export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`
LANGUAGE=nodejs

run:
	node test.node.js

bind: c-source libobject.so node_modules
	valabind-cc $(LANGUAGE) object -NValaObject ../../object.vapi -I. -I../../ $(GOBJECT_HEADERS) -I/usr/include -L../.. -lobject -x

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

node_modules:
	npm install

clean:
	rm -fr *.typelib *.so *.gir *.vapi *.c *.h *.i *.cxx object.js node_modules