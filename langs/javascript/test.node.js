// Install gir.js: https://github.com/creationix/node-gir

var gir = require("gir");
gir.init();
var ValaObject = gir.load('ValaObject')

ValaObject.sayHelloTo('Node.js');

// FIXME
// var inst = new ValaObject.ValaClass();
// console.log(inst); // => {}
// console.log(inst.append_to_name('called from Node.js'));
