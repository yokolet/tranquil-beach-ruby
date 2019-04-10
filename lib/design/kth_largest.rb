class KthLargest

=begin
    :type k: Integer
    :type nums: Integer[]
=end
  def initialize(k, nums)
    @k = k
    @nums = nums.sort_by { |v| -v }[0, k]
  end

=begin
    :type val: Integer
    :rtype: Integer
=end
  def add(val)
    if @nums.size == @k
      @nums[-1] = val if @nums[-1] < val
    else
      @nums << val
    end
    @nums = @nums.sort_by { |v| -v }
    @nums[-1]
  end
end