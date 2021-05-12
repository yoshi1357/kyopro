INF=Float::INFINITY
N,M=gets.split.map(&:to_i)
G = Array.new(M){Array.new()}

node_cost=Array.new(N){INF}
edge_cost=Array.new(N){Array.new(N){INF}}
N.times{|i|
  edge_cost[i][i] = 0
}

M.times{
  from, to, cost = gets.split.map(&:to_i)
  G[from].push(to)
  edge_cost[from][to] = cost
}

N.times{|k|
  N.times{|i|
    N.times{|j|
      edge_cost[i][j] = [ edge_cost[i][j], edge_cost[i][k] + edge_cost[k][j] ].min
    }
  }
}

flag = false
N.times{|i|
  N.times{|j|
    if edge_cost[i][j] == INF
      edge_cost[i][j] = "INF"
    end

    flag = true if i == j && edge_cost[i][j] < 0
  }
}

if flag
  puts "NEGATIVE CYCLE"
else
  edge_cost.each{|ec|
    puts ec.join(" ")
  }
end

