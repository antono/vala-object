export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd):$(shell pwd)
export SWIGFLAGS=-d2

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`
LANGUAGE=dlang

run: build-swig
	./test

# TODO
bind: c-source libobject.so
	valabind --$(LANGUAGE) -m object -N ValaObject -V ../.. object -o vala_d_object.d
	
swig: c-source libobject.so
	valabind-cc d vala_d_object -NValaObject ../../object.vapi -I. -I../../ $(GOBJECT_HEADERS) -I/usr/include -L../.. -lobject -x
	mv vala_d_object.so libvala_d_object_wrap.so

build-swig:
	dmd test.d vala_d_object_im.d vala_d_object.d

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

clean:
	rm -fr *.so *.i *.cxx *.o vala_d_object.d vala_d_object_im.d test