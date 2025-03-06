class StringCalculator < ApplicationRecord
  def add
    return 0 if string_number.blank?

    delimitters = [",", "\n"]
    regex_string = delimitters.join('|')
    regex_pattern = Regexp.new(regex_string)
    number_array = string_number.split(regex_pattern)
    sum = number_array.map{|num| num.to_i}.sum
    sum
  end
end
