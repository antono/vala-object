<?php
use GObject\ParamSpec as GParamSpec;

if (extension_loaded("gobject")) {

	GIRepository\load_ns('ValaObject');
	ValaObject\say_hello_to("PHP");

	// creating objects are not working at the moment
	// $inst = new ValaObject\ValaClass;
	// print_r ($inst);
	// $inst->append_to_name("called from PHP");
} else {
	print ":-(\n";
}

?>