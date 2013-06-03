<?php
use GObject\ParamSpec as GParamSpec;

if (extension_loaded("gobject")) {
	GIRepository\load_ns('GObject');
	GIRepository\load_ns('ValaObject');
	ValaObject\say_hello_to("php");

	// creating object is not working atm
	// $inst = new ValaObject\ValaClass;
	// print_r ($inst);
	// $inst->append_to_name("teset");
} else {
	print ":-(\n";
}

?>