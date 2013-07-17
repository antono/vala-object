var ValaObject = require("./vala_node_object");

//ValaObject.say_hello_to('Node.js');

var inst = new ValaObject.ValaClass();
console.log(inst.append_to_name('called from Node.js'));