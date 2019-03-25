class ValidNumber
  # @param {String} s
  # @return {Boolean}
  def is_number(s)
    return true if /^\s*[+-]?(\d+(\.\d*)?|\.\d+)([Ee][+-]?\d+)?\s*$/.match(s)
    false
  end
end