export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`

run:
	node test.node.js

bind: c-source libobject.so node_modules
	valabind --node-ffi -m object -N ValaObject -V ../.. object -o vala_node_object.js

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

node_modules:
	npm install

clean:
	rm -fr *.typelib *.so *.gir *.vapi *.c *.h *.i *.cxx vala_node_object.js node_modules 