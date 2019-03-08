class IntegerToEnglish
  # @param {Integer} num
  # @return {String}
  def number_to_words(num)
    result = to_english(num).join(' ')
    result.empty? ? 'Zero' : result
  end

  UNDER19 = [
      'One', 'Two', 'Three', 'Four',
      'Five', 'Six', 'Seven', 'Eight', 'Nine',
      'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen',
      'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'
  ]
  TENS = [
      'Twenty', 'Thirty', 'Forty',
      'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'
  ]
  ORDERS = [
      'Thousand', 'Million', 'Billion'
  ]

  def to_english(num)
    case
    when num == 0
      return []
    when num < 20
      return [UNDER19[num - 1]]
    when num < 100
      return [TENS[num / 10 - 2]] + to_english(num % 10)
    when num < 1000
      return [UNDER19[num / 100 - 1]] + ['Hundred'] + to_english(num % 100)
    else
      ORDERS.each.with_index(1) do |order, i|
        if num < 1000**(i+1)
          return to_english(num / 1000**i) + [order] +  to_english(num % 1000**i)
        end
      end
    end
  end
end