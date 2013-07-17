export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

run:
	nw .

bind: c-source libobject.so node_modules ref ffi
	valabind --node-ffi -m object -N ValaObject -V ../.. object -o vala_node_object.js

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

node_modules:
	npm install

ref: node_modules
	cd node_modules/ref; \
	node-gyp clean; \
	../nw-gyp/bin/nw-gyp.js configure --target=0.6.2; \
	../nw-gyp/bin/nw-gyp.js build

ffi: node_modules
	cd node_modules/ffi; \
	node-gyp clean; \
	../nw-gyp/bin/nw-gyp.js configure --target=0.6.2; \
	../nw-gyp/bin/nw-gyp.js build

clean:
	rm -fr *.typelib *.so *.gir *.vapi *.c *.h *.i *.cxx vala_node_object.js node_modules 