N,K=gets.split.map(&:to_i)
A=gets.split.map(&:to_i)
B=gets.split.map(&:to_i)

k_max=0
N.times{ |i| k_max += (A[i]-B[i]).abs }

if k_max > K
  puts "No"
  exit
end

if K%2 == 0
  if A.sum%2 == B.sum%2
    puts "Yes"
  else
    puts "No"
  end
else
  if A.sum%2 == B.sum%2
    puts "No"
  else
    puts "Yes"
  end
end