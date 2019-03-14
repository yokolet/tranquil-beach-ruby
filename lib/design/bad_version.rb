class BadVersion
  # @param {Integer} version
  # @return {boolean} whether the version is bad
  def is_bad_version(version)
    nil
  end

  # @param {Integer} n
  # @return {Integer}
  def first_bad_version(n)
    return n if n == 1 && is_bad_version(n)
    low, high = 0, n
    while low <= high
      mid = (low + high) / 2
      is_bad = is_bad_version(mid)
      if is_bad
        if is_bad_version(mid - 1)
          high = mid - 1
        else
          return mid
        end
      else
        if is_bad_version(mid + 1)
          return mid + 1
        else
          low = mid + 1
        end
      end
    end
    mid
  end
end