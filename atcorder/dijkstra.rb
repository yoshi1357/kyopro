# 優先度付きキューが実装できでない

INF=Float::INFINITY

N,M,s=gets.split.map(&:to_i)
G = Array.new(N){Array.new()}
node_cost={}
N.times{|i| node_cost[i] = INF}
edge_cost={}
M.times{
  from, to, cost = gets.split.map(&:to_i)
  G[from].push(to)
  edge_cost[[from, to]] = cost
}
path=[]
# 確定ノードのフラグ
done = {}
N.times{|i| done[i] = false}

# スタートのコストは0
node_cost[s] = 0

# 未確定のノードの中から、コストを更新できるものが無くなるまで繰り返し
while true do
  u = nil
  # 未確定ノードの中から、最もスタートからのコストが低いノードを取り出す
  node_cost.keys.reject{|node| done[node]}.each{|node|
    u = node if u.nil? || node_cost[u] > node_cost[node]
  }
  break if u.nil? #未確定ノードが無くなれば終了
  done[u] = true #このuは↓の操作で、スタートからの最小コストが決定されているため確定ノード

  G[u].each{|next_u|
    if ( node_cost[u] + edge_cost[[u, next_u]] ) < node_cost[next_u]
      node_cost[next_u] = node_cost[u] + edge_cost[[u, next_u]]
      path.push([u,next_u])
    end
  }
end

N.times{|i| node_cost[i] = "INF" if node_cost[i] == INF}

puts node_cost.values
p path