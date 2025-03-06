class StringCalculator < ApplicationRecord

  def fetch_new_delimitter
    new_delimitter = nil
    if string_number.start_with?("//")
      new_delimitter = string_number[2]
    end
    new_delimitter
  end

  def add
    return 0 if string_number.blank?

    delimitters = [",", "\n"]
    new_delimitter = fetch_new_delimitter
    delimitters << new_delimitter if new_delimitter.present?

    regex_string = delimitters.join('|')
    regex_pattern = Regexp.new(regex_string)

    number_array = string_number.split(regex_pattern)
    sum = number_array.map{|num| num.to_i}.sum
    sum
  end
end
