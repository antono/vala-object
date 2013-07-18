<?php
include ("object.php");

//ValaClass::say_hello_to("PHP");

$inst = new ValaClass ();
print $inst->append_to_name ("called from PHP\n");
?>