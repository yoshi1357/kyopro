# # 入力を受け取る
N, M = gets.split.map(&:to_i)
graph = Array.new(N){Array.new()}
M.times{
  nood, edge = gets.split.map(&:to_i)
  graph[nood].push(edge)
}

# # 全ての頂点を未訪問に初期化
@seen = Array.new(N, false)
todo = []

# # seenとtodoをスタートの頂点0で初期値を設定
@seen[0] = true
todo.push(0)

@first_order = Array.new(N, 0) # 各頂点の行きがけ順
@last_order = Array.new(N, 0) # 各頂点の帰りがけ順

def dfs(g, v, ptr)
  # vを訪問済にする
  @seen[v] = true
  @first_order[v] = (@ptr += 1)

  g[v].each{|nv|
    # 訪問済みならスキップ
    next if @seen[nv]

    dfs(g, nv, ptr)
  }

  @last_order[v] = (@ptr += 1)
end

@ptr = 0

dfs(graph, 0, @ptr)

p @first_order
p @last_order