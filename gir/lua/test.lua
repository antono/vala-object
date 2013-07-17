-- sudo apt-get install lua5.1 luarocks
-- luarocks install lgi

require 'luarocks/loader'

ValaObject = require('lgi').ValaObject
ValaObject.say_hello_to('Lua')

local table = ValaObject.ValaClass()
local str   = table.append_to_name(table, "called from lua")

print(str)
