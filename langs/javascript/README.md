# GObjects for JavaScript

You can use [GObjects](http://en.wikipedia.org/wiki/GObject)
from any of 3 js intrepreters:

 - [Node.js](http://nodejs.org/) via [gir.js](https://github.com/creationix/node-gir)
 - [seed](https://live.gnome.org/Seed) with native GObject support
 - [gjs](https://live.gnome.org/Seed) with native GObject support

## Node.js setup

You will need Node.js >= 0.6.0 and recent [npm](https://github.com/isaacs/npm)

   npm install gir
   ./node-run.sh test.node.js

## Seed or gjs

   ./gnome-run.sh test.gnome.js
