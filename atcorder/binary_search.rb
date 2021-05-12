N=gets.to_i
@S=gets.split.map(&:to_i)
Q=gets.to_i
T=gets.split.map(&:to_i)

def isOK?(index, key)
  @S[index] >= key ? true : false
end

def binary_search(key)
  left = -1
  right = @S.size

  while (right - left > 1) do
    mid = left + (right - left) / 2
    if isOK?(mid, key)
      right = mid
    else
      left = mid
    end
  end

  return right
end

cnt=0
T.each{|num|
  if num == @S[binary_search(num)]
    cnt += 1
  end
}

puts cnt