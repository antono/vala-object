export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`
LANGUAGE=c++

run: build
	
bind: c-source libobject.so
	valabind-cc $(LANGUAGE) libobject -NValaObject ../../object.vapi -I. -I../../ -I/usr/include -I/usr/include/tcl8.6 $(GOBJECT_HEADERS) -L../.. -L/usr/lib/ -L/usr/local/lib -lobject -x

build:
	gcc test.cpp -I. -I../../ -I/usr/include -I/usr/include/tcl8.6 $(GOBJECT_HEADERS) -L. -lobject
	#gcc test.cpp

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

clean:
	rm -fr *.so *.i *.cxx object.d object_im.d *.out