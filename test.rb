# Nested hash to nested struct.
 
# From: http://www.roscripts.com/snippets/show/20
# Author: Mike Hasting (duvion)
 
# Note: An empty string used as a key will cause 1.8 to choke
require 'ap'
class Hash
   def to_struct(struct_name)
      Struct.new(struct_name,*keys).new(*values)
   end
end
 
if $0 == __FILE__
   h = {"name"=>"Dan","age"=>33,"address"=>{"street"=>"Burlington rd, 33"}}
 
   h["address"]=h["address"].to_struct("B")
   s = h.to_struct("Foo")
 
   ap s.inspect
   ap "name: " + s.name
   ap "age: " + s.age.to_s
   ap "street: " + s.address.street
end

treehouse = [phone: 888, bus_name: "tree", loc: "sdf"]
ap treehouse
a = treehouse.map {|key, value| value = "(treehouse) #{value}"}
ap a
ap treehouse