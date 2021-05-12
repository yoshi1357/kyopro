N,A = 5,12
ary = [7,5,3,1,8]

INF = 10 ** 10
dp = Array.new(110) {Array.new(10010, INF)}
dp[0][0] = 0

N.times do |i|
  0.upto(A) do |j|
    dp[i+1][j] = dp[i][j]
    if j >= ary[i]
      dp[i+1][j] = [ dp[i+1][j], dp[i][j - ary[i]] + 1 ].min
    end
  end
end

puts dp[N][A]