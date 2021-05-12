input = readlines(chomp: true).map{|x| x.split.map(&:to_i)}

N,W = input.shift

values = []
weights = []
input.each do |item|
  values.push(item[0])
  weights.push(item[1])
end

dp = Array.new(110) {Array.new(10010)}
0.upto(W) do |w|
  dp[0][w] = 0
end

# iはvalues, weightsの配列を取り出したいのでi<N
# W以下という条件なのでw<=W
N.times do |i|
  0.upto(W) do |w|
    if w >= weights[i]
      dp[i+1][w] = [ dp[i][w - weights[i]] + values[i], dp[i][w] ].max
    else
      dp[i+1][w] = dp[i][w]
    end
  end
end

puts dp[N][W]