
def iterate(h)
  h.each do |k,v|
    # If v is nil, an array is being iterated and the value is k. 
    # If v is not nil, a hash is being iterated and the value is v.
    # 
    value = v || k

    if value.is_a?(Hash) || value.is_a?(Array)
      puts "evaluating: #{value} recursively..."
      iterate(value)
    else
      # MODIFY HERE! Look for what you want to find in the hash here
      # if v is nil, just display the array value
      puts v ? "key: #{k} value: #{v}" : "array value #{k}"
    end
  end
end
h = {
  :key1 => 'value1',
  :key2 => 'value2',
  :key3 => {
    :key4 => [{:key4_1 => 'value4_1', :key4_2 => 'value4_2'}],
    :key5 => 'value5'
  },
  :key6 => {
    :key7 => [1,2,3],
    :key8 => {
      :key9 => 'value9'
    }
  }
}
iterate h