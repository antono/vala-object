import std.stdio;
import std.conv;

void main() {
	// say_hello_to ("Java");
	auto vala_object = new ValaClass();
	writefln (vala_object.append_to_name ("called from D"));
}