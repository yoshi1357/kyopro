H,W=gets.split.map(&:to_i)
field_cost=H.times.map{gets.split.map(&:to_i)}

INF=Float::INFINITY

done=Array.new(H){Array.new(W){false}}

cost=Array.new(H){Array.new(W){INF}}
cost[0][0]=0

dx=[0,1,0,-1]
dy=[1,0,-1,0]


while true do
  u=nil;v=nil
  H.times{|i|
    W.times{|j|
      next if done[i][j] == true
      if ( u.nil? && v.nil? ) || cost[u][v] > cost[i][j]
        u=i;v=j
      end

    }
  }
  break if u.nil? && v.nil?
  done[u][v]=true

  4.times{|i|
    next_u = u + dy[i]
    next_v = v + dx[i]

    next if next_u >= H || next_v >= W || next_u < 0 || next_v < 0

    next if done[next_u][next_v]

    if cost[u][v] + field_cost[next_u][next_v] < cost[next_u][next_v]
      cost[next_u][next_v] = cost[u][v] + field_cost[next_u][next_v]
    end
  }
end

puts cost[H-1][W-1]