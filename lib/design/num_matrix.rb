class NumMatrix

=begin
    :type matrix: Integer[][]
=end
  def initialize(matrix)
    m = matrix.size
    n = matrix[0].nil? ? 0 : matrix[0].size
    @acc_sum = [Array.new(n + 1, 0)]
    m.times do |i|
      s = matrix[i].reduce([0]) {|acc, x| acc+[acc[-1] + x]}
      @acc_sum << @acc_sum[-1].zip(s).map {|x| x[0] + x[1]}
    end
  end

=begin
    :type row1: Integer
    :type col1: Integer
    :type row2: Integer
    :type col2: Integer
    :rtype: Integer
=end
  def sum_region(row1, col1, row2, col2)
    result = @acc_sum[row2 + 1][col2 + 1]
    result -= @acc_sum[row1][col2+1]
    result -= @acc_sum[row2+1][col1]
    result += @acc_sum[row1][col1]
    result
  end
end