class RainWater
  # @param {Integer[]} height
  # @return {Integer}
  def trap(height)
    left, right, total = 0, height.size - 1, 0
    left_max, right_max = height[left], height[right]
    while left < right
      left_max, right_max = [left_max, height[left]].max, [right_max, height[right]].max
      if left_max <= right_max
        total += (left_max - height[left])
        left += 1
      else
        total += (right_max - height[right])
        right -=1
      end
    end
    total
  end
end