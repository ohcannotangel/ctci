#!/usr/bin/ruby -Ku
# -*- encoding: utf-8 -*-

$left = '('
$right = ')'

def main(num)
  puts "num: #{num}"
  str = Array.new(num*2)
  generate_parens(str, num, num, 0)
end

# 対応する括弧を生成する
def generate_parens(str, rest_left, rest_right, count)

  # invalid
  if rest_left < 0 || rest_right < rest_left
    puts "error"
    return
  end

  if rest_left == 0 && rest_right == 0
    # for test
    msg = check_pair(str) ? "OK" : "NG"
    print str.join('') + " : #{msg}\n"
    # puts str.join('')
    return

  else
    if rest_left != 0           # 左括弧
      str[count] = $left
      generate_parens(str, rest_left-1, rest_right, count+1)
    end

    if rest_right > rest_left   # 右括弧
      str[count] = $right
      generate_parens(str, rest_left, rest_right-1, count+1)
    end

  end
end

def check_pair(array)

  flg = true

  # 偶数かどうか
  if array.length.odd?
    flg = false
  else
    left = right = 0;
    # 先頭と後ろのチェック
    if (array[0] != $left) or (array[-1] != $right)
      flg = false
    else
      open_pair = 0
      array.each do |elem|
        if elem == $left
          left += 1
          open_pair += 1
        elsif elem == $right
          right += 1
          open_pair -= 1
          if open_pair < 0
            flg = true
            break
          end
        else
          flg = true # $left $right以外の文字列
          break
        end
      end

      if left != right
        flg = true
      end

    end
  end

  return flg

end

main(2)
main(3)
main(4)

########################
# 実行結果
########################
# $ ./9_6.rb                                                                                                                                                                                                           [11:13]
# num: 2
# (()) : OK
# ()() : OK
# num: 3
# ((())) : OK
# (()()) : OK
# (())() : OK
# ()(()) : OK
# ()()() : OK
# num: 4
# (((()))) : OK
# ((()())) : OK
# ((())()) : OK
# ((()))() : OK
# (()(())) : OK
# (()()()) : OK
# (()())() : OK
# (())(()) : OK
# (())()() : OK
# ()((())) : OK
# ()(()()) : OK
# ()(())() : OK
# ()()(()) : OK
# ()()()() : OK
