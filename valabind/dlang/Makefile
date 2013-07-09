export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`
LANGUAGE=d


run: build
	
bind: c-source libobject.so
	valabind-cc $(LANGUAGE) object -NValaObject ../../object.vapi -I. -I../../ $(GOBJECT_HEADERS) -I/usr/include -L../.. -lobject -x

build:
	dmd test.d -I/usr/include/dmd/tango

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

clean:
	rm -fr *.so *.i *.cxx object.d object_im.d