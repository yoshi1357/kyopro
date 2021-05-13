@N=gets.to_i
@A=gets.split.map(&:to_i).sort
Q=gets.to_i
INF=Float::INFINITY

def isOK?(index, key)
  @A[index] <= key ? true : false
end

def binary_search(key)
  ok=-1
  ng=@N

  while (ng-ok > 1) do
    mid = (ok + ng) / 2

    if isOK?(mid, key)
      ok=mid
    else
      ng=mid
    end
  end

  return ok
end



Q.times{
  score=gets.to_i

  index=binary_search(score)

  dis1=(score - @A[index]).abs

  index == @N-1 ? dis2 = INF : dis2 = (score - @A[index+1]).abs

  puts [dis1, dis2].min
}