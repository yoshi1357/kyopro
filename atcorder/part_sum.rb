N,A = 3,10
ary = [7,5,3]

dp = Array.new(110){Array.new(10010, false)}
dp[0][0] = true

N.times do |i|
  0.upto(A) do |j|
    dp[i+1][j] = dp[i][j]
    if j >= ary[i]
      # ↓はdp[i+1][j] = dp[i+1][j] || dp[i][j - ary[i]]の意味
      # dp[i][j] == trueならd[i][j]もtrueが返る
      dp[i+1][j] |= dp[i][j - ary[i]]
    end
  end
end

if dp[N][A]
  puts "YES"
else
  puts "NO"
end