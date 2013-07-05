from gi.repository import ValaObject

ValaObject.say_hello_to('Python')

instance = ValaObject.ValaClass()
print instance.append_to_name("called from Python")
