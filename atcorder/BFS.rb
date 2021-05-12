# 入力を受け取る
N, M = gets.split.map(&:to_i)
graph = Array.new(N){Array.new()}
M.times{
  nood, edge = gets.split.map(&:to_i)
  graph[nood].push(edge)
}

# dist[v] == -1 は未発見の頂点v
# queは発見済みだが未訪問の頂点v
dist = Array.new(N, -1)
que = []

# 頂点0はスタート地点なのでdist[0]=0
# 頂点0を発見済みだが未訪問に追加
dist[0] = 0
que.push(0)

# queが空になるまで探索を続ける
while ! que.empty? do
  # 訪れる頂点をvとする
  v = que.shift

  # 現在の頂点から辿れる頂点を発見済みにする
  graph[v].each{|nv|
    # 辿れる頂点が訪問済みの場合はスルー
    next if dist[nv] != -1

    # 次に辿れる頂点のスタートからの距離 = ( 現在いる頂点の距離 + 1 )になる
    # 次に辿る頂点としてqueにnvを追加する
    dist[nv] = dist[v] + 1
    que.push(nv)
  }
end

dist.each.with_index{|d, i| puts [i, d].join(": ")}