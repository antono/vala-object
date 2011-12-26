require 'gir_ffi'

GirFFI.setup(:ValaObject)

class MyValaClass < ValaObject::ValaClass
  def append_to_name(suffix)
    super + ' (subclassed) ' + suffix
  end
end

instance = MyValaClass.new
puts instance.append_to_name("called from Ruby")
