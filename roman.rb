class Integer
  def to_roman(number = self, numeral = '')
    fail ArgumentError unless number.is_a?(Integer)
    return 'There is no Roman Numeral for 0' if self == 0
    return numeral if number == 0
    numeral_conversion.keys.each do |divisor|
      quotient, modulus = number.divmod(divisor)
      numeral << numeral_conversion[divisor] * quotient
      return to_roman(modulus, numeral) if quotient > 0
    end
  end

  private

  def numeral_conversion
    {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I'
    }
  end
end
