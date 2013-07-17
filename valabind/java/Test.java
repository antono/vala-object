/* Run: java -Djava.library.path=. TestRBin */
import java.util.*;

class Test {
	static {
		System.loadLibrary("object");
	}
	public static void main (String args[]) {

		// say_hello_to ("Java");

		ValaClass vala_object;
		vala_object = new ValaClass ();
		System.out.printf (vala_object.append_to_name ("called from Java"));
		
	}
}