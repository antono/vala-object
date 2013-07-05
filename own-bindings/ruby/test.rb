require 'gir_ffi' # gem install gir_ffi

GirFFI.setup(:ValaObject)

ValaObject.say_hello_to('Ruby')

instance = ValaObject::ValaClass.new

puts instance.append_to_name("called from Ruby")
