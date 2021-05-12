H,W=gets.split.map(&:to_i)
nums=H.times.map{gets.split.map(&:to_i)}

row_sum=[]
column_sum=[]

H.times{|i|
  row_sum.push(nums[i].sum)
}

W.times{|j|
  part_sum=0
  H.times{|i|
    part_sum += nums[i][j]
  }
  column_sum.push(part_sum)
}

result=Array.new(H){Array.new(W){0}}
H.times{|i|
  W.times{|j|
    result[i][j] = row_sum[i] + column_sum[j] - nums[i][j]
  }
}

result.each{|r|
  puts r.join(" ")
}