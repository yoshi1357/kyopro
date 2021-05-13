N=gets.to_i
A=gets.split.map(&:to_i).sort
B=gets.split.map(&:to_i).sort


# A,Bをソートして貪欲法
dis_sum=0
N.times{|i|
  dis_sum += (A[i] - B[i]).abs
}

puts dis_sum


