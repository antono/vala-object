#!/usr/bin/perl

use Glib::Object::Introspection;

Glib::Object::Introspection->setup(
    basename 	=> 'ValaObject',
    version 	=> '0.1',
    package 	=> 'ValaObject',
    search_path => 'build'
);

ValaObject->say_hello_to("Perl");

my $instance = ValaObject::ValaClass->new();
print $instance->append_to_name("called from Perl\n");