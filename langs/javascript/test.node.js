// Install gir.js: https://github.com/creationix/node-gir

var gir = require("gir");
gir.init();
gir.load('ValaObject').sayHelloTo('Node.js');
