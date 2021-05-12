# sからgにたどり着けるか？

# 10 10
# s.........
# #########.
# #.......#.
# #..####.#.
# ##....#.#.
# #####.#.#.
# g.#.#.#.#.
# #.#.#.#.#.
# #.#.#.#.#.
# #.....#...

# 入力の受け取り
@H, @W = gets.split.map(&:to_i)
@fields = @H.times.map{gets.chomp.chars}

# 4方向移動用のベクトルを作る
@dx = [1, 0, 0, -1]
@dy = [0, 1, -1, 0]

# sとgがあるマスを特定
sx, sy = -1, -1
gx, gy = -1, -1
@H.times{|j|
  @W.times{|i|
    sx, sy = i, j if @fields[j][i] == "s"
    gx, gy = i, j if @fields[j][i] == "g"
  }
}

# 探索済みを表すseen
@seen = Array.new(510){Array.new(510, false)}

# 探索用のdfsを作成
def dfs(w, h)
  @seen[h][w] = true

  @dx.size.times{|i|
    # 次に探索するx, yを決める
    nx = w + @dx[i]
    ny = h + @dy[i]

    # 次に探索するマスが場外や壁の場合はスルー
    next if nx < 0 || nx >= @W || ny < 0 || ny >= @H || @fields[ny][nx] == "#"

    # 次に行くマスが探索済みならスルー
    next if @seen[ny][nx]

    dfs(nx, ny)
  }

end

dfs(sx, sy)

if @seen[gy][gx]
  puts "Yes"
else
  puts "No"
end