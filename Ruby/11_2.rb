#!/usr/bin/ruby -Ku
# -*- encoding: utf-8 -*-

def main
  array = ['*apple', 'aplle', '*aplpe', '*mncaoo', '*aplep', 'monac', '*monaco']
  sorted_array = sort(array)
  puts sorted_array
end

def sort(array)
  # grouping by anagram
  groupingMap = {}
  array.each do |word|
    # キーを生成
    key = sortWord(word)
    # キーがなければ空の配列をセットしてから単語をpush
    unless groupingMap.member?(key)
      groupingMap[key] = []
    end
    groupingMap[key].push(word)
  end

  # make new array
  sorted = []
  groupingMap.each do |k, v|
    v.each do |word|
      sorted.push(word)
    end
  end
  return sorted
end

# アナグラムになっていれば同一のキーを返す関数
def sortWord(word)
  array = word.split('')
  key = array.sort().join()
  return key
end

main()

