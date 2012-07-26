// Install gir.js: npm install gir@latest
// more infos on: https://github.com/creationix/node-gir

var gir = require("gir");
gir.init();
var ValaObject = gir.load('ValaObject');

ValaObject.say_hello_to('Node.js');

var inst = new ValaObject.ValaClass();
console.log(inst); // => {}
console.log(inst.append_to_name('called from Node.js'));
