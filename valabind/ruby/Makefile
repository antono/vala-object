export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`
HEADERS=-I/usr/lib/ruby/1.8/x86_64-linux/ -I/usr/lib/ruby/1.8/i686-linux/
RUBY1.9.1_HEADERS=-I/usr/lib/ruby/1.9.1/x86_64-linux/ -I/usr/lib/ruby/1.9.1/i686-linux/
LANGUAGE=ruby

run:
	-ruby1.8 test.rb
	-ruby test.rb

bind: c-source libobject.so
	valabind-cc $(LANGUAGE) object -NValaObject ../../object.vapi -I. -I../../ $(HEADERS) $(GOBJECT_HEADERS) -I/usr/include -L../.. -lobject -x

c-source:
	make c-source -C ../../

libobject.so:
	 make libobject.so -C ../../

clean:
	rm -fr *.typelib *.so *.gir *.vapi *.c *.h *.i *.cxx