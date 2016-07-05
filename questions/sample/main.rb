require 'benchmark'

module Q00
  module_function

  @memo = {}

  def run
    return @memo[n] if @memo.has_key?(n)
    if (n == 0) || (n == 1) then
      @memo[n] = 1
    else
      @memo[n] = run(n - 1) + run(n - 2)
    end
  end
end

Benchmark.bm do |x|
  x.report do
    $answer = Q00.run
  end
end

puts
puts "answer : #{$answer}"
