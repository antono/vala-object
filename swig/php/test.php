<?php
include(dirname(__FILE__)."/../../object.php");
//say_hello_to("php")
$vala_object = new ValaClass ();
print $vala_object->append_to_name ("called from php");
?>