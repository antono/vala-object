namespace ValaObject {
	public void say_hello_to (string lang) {
		print(@"I love You, $lang!!!\n");
		print("-- Vala\n\n");
	}

	public class ValaClass : Object {
		public string name = "Vala Class";

		public string append_to_name (string suffix) {
			return @"$name $suffix";
		}
	}
}
