N,A = 4,5
ary = [4,1,1,1]

dp = Array.new(110){Array.new(10010, 0)}
dp[0][0] = 1

N.times do |i|
  0.upto(A) do |j|
    dp[i+1][j] = dp[i][j]
    if j >= ary[i]
      # j >= ary[i] の時、dp[i+1][j] == dp[i][j] + dp[i][j - ary[i]]
      dp[i+1][j] += dp[i][j - ary[i]]
    end
  end
end

puts dp[N][A]