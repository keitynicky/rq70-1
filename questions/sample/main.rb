require 'benchmark'

module Q00
  module_function

  @memo = {}

  def run_back(n)
    return @memo[n] if @memo.has_key?(n)
    if (n == 0) || (n == 1) then
      @memo[n] = 1
    else
      @memo[n] = run(n - 1) + run(n - 2)
    end
  end

  MAX_COUNT = 11

  # フィボナッチ数列のうち、各桁の数字を足した数で割り切れる数を、小さい方から5個求める
  def run(n)
    # 直近の足し合わせを行うための変数（最初は1桁目と2桁目）
    a = b = 1
    # 処理上限を定める変数
    count = 0
    # なぜ11？？さらにできるけどそれ以上求めなくていいってするためなのかな。
    while (count < MAX_COUNT) do
      c = a + b
      sum = 0
      # 各桁の数を足した数を求めている処理
      c.to_s.split(//).each{|e| sum += e.to_i}

      if (c % sum == 0) then
        #   割り切れた場合に出力する
        puts c
        count += 1
      end
      # 一つ横の桁にずらしている
      a, b = b, c
    end
  end
end

Benchmark.bm do |x|
  x.report do
    $answer = Q00.run(10)
  end
end

puts
puts "answer : #{$answer}"
