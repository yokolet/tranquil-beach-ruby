class AddBinary
  # @param {String} a
  # @param {String} b
  # @return {String}
  def add_binary(a, b)
    sprintf("%b", a.to_i(2) + b.to_i(2))
  end
end