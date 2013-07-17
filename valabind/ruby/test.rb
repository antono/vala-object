require './object.so' # gem install gir_ffi

#ValaObject.say_hello_to('Ruby')

instance = ValaObject::ValaClass.new

puts instance.append_to_name("called from Ruby")
