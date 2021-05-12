H,W=gets.split.map(&:to_i)
field=H.times.map{gets.chomp.chars}
dot_cnt=field.flatten.count(".") - 2

dist=Array.new(H){Array.new(W){-1}}
que=[]

dist[0][0]=0
que.push([0, 0])

dx = [1, 0, 0, -1]
dy = [0, 1, -1, 0]

while ! que.empty? do
  h, w = que.shift

  4.times{|i|
    nh=h+dy[i]
    nw=w+dx[i]

    # 次に探索するマスが場外や壁の場合はスルー
    next if nw < 0 || nw >= W || nh < 0 || nh >= H

    next if field[nh][nw] == "#"

    # 次に行くマスが探索済みならスルー
    next if dist[nh][nw] != -1

    dist[nh][nw] = dist[h][w] + 1
    que.push([nh, nw])

    if nh == H-1 && nw == W-1
      puts dot_cnt - (dist[H-1][W-1] - 1)
      exit
    end
  }
end

puts -1


