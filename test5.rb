line_items = {
  item_a: {
    name: "Cookie",
    total: 13
  },
  department_x: {
    item_b: {
      name: "s",
      total: 7
    }
  },
  items: [
    {
      name: "H",
      total: 8
    },
    {
      name: "Q",
      total: 9
    }
  ]
}
class Hash
  def find_all_values_for(key)
    result = []
    puts "self[key] = #{self[key]}"
    result << self[key]
    self.values.each do |hash_value|
      puts "hash_value = #{hash_value}"
      values = [hash_value] unless hash_value.is_a? Array
      values.each do |value|
        puts "value = #{value}"
        puts
        result += value.find_all_values_for(key) if value.is_a? Hash
      end
    end
    result.compact
  end
end

puts 
puts "line_items.find_all_values_for(:total) = #{line_items.find_all_values_for(:total)}"

puts line_items.find_all_values_for(:total).sum

puts line_items.find_all_values_for(:name).sum