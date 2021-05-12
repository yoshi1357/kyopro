N = 5
price = [10,20,30,40,50]

num = 2 ** N - 1
# 取りうる値をすべて配列に格納
results = []
0.upto(num) do |n|
    coin = n.to_s(2).rjust(N, "0").split('').map(&:to_i)
    ans = 0
    N.times do |i|
        ans += coin[i] * price[i]
    end
    results << ans
end

p results
