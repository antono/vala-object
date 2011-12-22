namespace ValaObject {
	public void say_hello_to(string lang)
	{
		print(@"I love You, $lang!!!\n");
		print("-- Vala\n\n");
	}

	public class ValaClass {
		public string name = "Vala Class";

		public string what_is_your_name() {
			return name;
		}
	}
}
