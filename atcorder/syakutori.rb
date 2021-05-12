N=10
x=28
a_i=[5,1,2,5,10,7,4,9,2,8]

sum = 0
right = 0
min_cnt = N + 1

N.times{|left|
  while right < N && sum <= x do
    sum += a_i[right]
    right += 1
  end

  break if sum < x

  cnt = (right - left)
  if cnt < min_cnt
    min_cnt = cnt
  end

  if left == right
    right += 1
  else
    sum -= a_i[left]
  end
}

if min_cnt == N + 1
  min_cnt = 0
end
puts min_cnt