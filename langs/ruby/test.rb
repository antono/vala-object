require 'gir_ffi' # gem install gir_ffi

GirFFI.setup(:ValaObject)

ValaObject.say_hello_to('Ruby')
