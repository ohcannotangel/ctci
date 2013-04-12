# -*- coding: utf-8 -*-
# ver1
def uniq(array)
  hash = {}
  ret = []
  array.each do |e|
    unless hash.member?(e)
      hash[e] = nil
      ret.push(e)
    end
  end
  return ret
end

# ver2
# バッファを使わない
def uniq!(array)
  array.each_with_index do |e, i|
    array[i+1..-1].each_with_index do |e2, j|
      if e == e2
        array.delete_at(i+1 + j)
      end
    end
  end
end

# ver3
# hash.keysを使う
def uniq_with_hash(array)
  hash = {}
  array.each do |e|
    hash[e] = nil
  end
  return hash.keys
end


# +++++++++ test ++++++++++ #
array1 = [1, 4, 3, 3, 1, 2, 4]
puts "original:"
p array1

puts "ver1"
p uniq(array1)

puts "ver2"
uniq!(array1)
p array1

puts "ver3"
p uniq_with_hash(array1)

