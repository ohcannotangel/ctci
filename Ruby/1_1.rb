# -*- coding: utf-8 -*-
def unique?(str)
  hash = {}
  str.each_char do |c|
    if hash.has_key?(c)
      return true
    else
      hash[c] = nil
    end
  end
  return false
end

def main()
  str = ARGV[0]
  if unique?(str)
    p "not unique"
  else
    p "unique"
  end
end

main()
