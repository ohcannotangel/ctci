#!/usr/bin/ruby -Ku
# -*- encoding: utf-8 -*-

$left = '('
$right = ')'

def main(num)
  puts "num: #{num}"
  # 最初は左括弧しか入らないので初期値設定してから実行
  generate_parens(1, [$left], num-1, num*2-1)
end

# 対応する括弧を生成する
# open_pair     : ペアになっていない括弧の数
# result_array : 結果配列
# rest         : 残りの括弧の数
# rest_left    : 残りの左括弧の数
def generate_parens(open_pair, result_array, rest_left, rest)

  if rest == 1
    # 右括弧を置いて終了
    result_array.push($right)
    print result_array.join("")
    check_pair(result_array)
    return
    
  else
    left_p = (rest_left == 0) ? false : true
    right_p = (open_pair == 0) ? false : true

    if left_p
      tmp = result_array.clone
      tmp.push($left)
      generate_parens(open_pair+1, tmp, rest_left-1, rest-1)
    end

    if right_p
      tmp = result_array.clone
      tmp.push($right)
      generate_parens(open_pair-1, tmp, rest_left, rest-1)
    end

  end
end


def check_pair(array)
  
  print array.join('')

  ng_flg = false
  # 偶数かどうか
  if array.length.odd?
    ng_flg = true
  else
    left = right = 0;
    # 先頭と後ろのチェック
    if (array[0] != $left) or (array[-1] != $right)
      ng_flg = true
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
            ng_flg = true
            break
          end
        else
          ng_flg = true         # $left $right以外の文字列
          break
        end
      end
      
      if !ng_flg && (left != right)
        ng_flg = true
      end

    end
  end
  
  if ng_flg
    print " : NG\n"
  else
    print " : OK\n"
  end

end
  
# test code
def test
  puts "test:"
  check_pair([')', ')'])
  check_pair(['(', '('])
  check_pair(['(', ')', ')', ')'])
  check_pair(['(', '(', '(', ')'])
  check_pair(['(', ')', '(', ')'])
end

# 実行
test()
print "\n"
main(2)
print "\n"
main(3)
print "\n"
main(4)

# 実行結果
# test:
# )) : NG
# (( : NG
# ())) : NG
# ((() : NG
# ()() : OK

# num: 2
# (())(()) : OK
# ()()()() : OK

# num: 3
# ((()))((())) : OK
# (()())(()()) : OK
# (())()(())() : OK
# ()(())()(()) : OK
# ()()()()()() : OK

# num: 4
# (((())))(((()))) : OK
# ((()()))((()())) : OK
# ((())())((())()) : OK
# ((()))()((()))() : OK
# (()(()))(()(())) : OK
# (()()())(()()()) : OK
# (()())()(()())() : OK
# (())(())(())(()) : OK
# (())()()(())()() : OK
# ()((()))()((())) : OK
# ()(()())()(()()) : OK
# ()(())()()(())() : OK
# ()()(())()()(()) : OK
# ()()()()()()()() : OK

