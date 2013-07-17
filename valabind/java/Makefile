export LD_LIBRARY_PATH:=$(shell cd ../.. && pwd)

GOBJECT_HEADERS=`pkg-config --cflags --libs gobject-2.0`
HEADERS=-I/usr/lib/jvm/java-7-openjdk-amd64/include/ -I/usr/lib/jvm/java-7-openjdk-amd64/include/linux
LANGUAGE=java

run: *.class
	java -Djava.library.path=. Test

bind: c-source libobject.so
	valabind-cc $(LANGUAGE) libobject -NValaObject ../../object.vapi -I. -I../../ $(HEADERS) $(GOBJECT_HEADERS) -I/usr/include -L../.. -lobject -x

*.class:
	javac *.java

c-source:
	make c-source -C ../../

libobject.so:
	make libobject.so -C ../../

clean:
	rm -fr *.typelib *.so *.gir *.vapi *.c *.h *.i *.cxx *.class ValaClass.java libobjectJNI.java libobject.java