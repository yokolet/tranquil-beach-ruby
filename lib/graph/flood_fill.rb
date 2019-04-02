class FloodFill
  # @param {Integer[][]} image
  # @param {Integer} sr
  # @param {Integer} sc
  # @param {Integer} new_color
  # @return {Integer[][]}
  def flood_fill(image, sr, sc, new_color)
    return [] if image.nil? || image.empty? || image[0].empty?
    m, n, color = image.size, image[0].size, image[sr][sc]
    return image if color == new_color
    stack = [[sr, sc]]
    image[sr][sc] = new_color
    while !stack.empty?
      cur_r, cur_c = stack.pop
      [[cur_r-1, cur_c], [cur_r, cur_c-1], [cur_r, cur_c+1], [cur_r+1, cur_c]].each do |i, j|
        if 0 <= i && i < m && 0 <= j && j < n && image[i][j] == color
          image[i][j] = new_color
          stack.push([i, j])
        end
      end
    end
    image
  end
end