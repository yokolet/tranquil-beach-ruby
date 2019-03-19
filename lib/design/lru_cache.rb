class LRUCache

=begin
    :type capacity: Integer
=end
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
  end


=begin
    :type key: Integer
    :rtype: Integer
=end
  def get(key)
    return -1 if !@cache.has_key?(key)
    value = @cache.delete(key)
    @cache[key] = value
    value
  end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
  def put(key, value)
    if @cache.has_key?(key)
      @cache.delete(key)
    elsif @cache.size == @capacity
      @cache.shift
    end
    @cache[key] = value
    nil
  end
end