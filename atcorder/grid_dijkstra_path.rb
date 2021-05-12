H,W=gets.split.map(&:to_i)
field_cost=H.times.map{gets.split.map(&:to_i)}

INF=Float::INFINITY

done=Array.new(H){Array.new(W){false}}

cost=Array.new(H){Array.new(W){INF}}
cost[0][0]=0

dx=[0,1,0,-1]
dy=[1,0,-1,0]

path=[]

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

seen=Array.new(H){Array.new(W){false}}
cur_h=0;cur_w=0

while true do

  seen[cur_h][cur_w]=true
  _min_cost=INF

  tmp_h=nil;tmp_w=nil

  4.times{|i|
    next_h=cur_h+dy[i]
    next_w=cur_w+dx[i]

    next if next_h >= H || next_w >= W || next_h < 0 || next_w < 0

    next if seen[next_h][next_w]

    if field_cost[next_h][next_w] < _min_cost
      _min_cost = field_cost[next_h][next_w]
      tmp_h=next_h;tmp_w=next_w
    end
  }

  cur_h=tmp_h;cur_w=tmp_w

  path.push([cur_h,cur_w])
  break if [cur_h, cur_w] == [H-1, W-1]
end

path.unshift([0,0])

puts cost[H-1][W-1]
path.reverse.each{|pa|
  h,w=pa
  cp_field=Marshal.load(Marshal.dump(field_cost))
  cp_field[h][w]= "*" + cp_field[h][w].to_s
  puts "--"
  cp_field.each{|cf|
    puts cf.join(" ")
  }

}