input = readlines(chomp: true).map{|x| x.split(' ').map(&:to_i)}
N,M,Q = input.shift
cons = input

arr = (1..M).to_a

combs = []
# A1<=A2<=A3...のため重複を許す組み合わせ
arr.repeated_combination(N) do |comb|
  combs.push(comb)
end

max_point = 0
combs.each do |comb|
  # 数列ごとの得点
  point = 0
  cons.each do |con|
    if ( comb[con[1] - 1] - comb[con[0] - 1] ) == con[2]
      point += con[3]
    end
  end
  max_point = point if point > max_point
end

puts max_point

