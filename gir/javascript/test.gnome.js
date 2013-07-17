// This example should work for both
// seed and gjs
var ValaObject = imports.gi.ValaObject;

ValaObject.say_hello_to('JavaScript')

var instance = new ValaObject.ValaClass()

print(instance.append_to_name("called from JS"))
