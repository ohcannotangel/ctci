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

puts "ver3"
p uniq_with_hash(array1)

# ++++++ result +++++
# original:
# [1, 4, 3, 3, 2, 1, 2, 4, 2, 2, 3, 4]
# ver1
# [1, 4, 3, 2]
# ver2
# [1, 4, 3, 2]
# ver3
# [1, 4, 3, 2]

