class StringCalculator < ApplicationRecord

  def fetch_new_delimitter(string_numbers)
    new_delimitter = nil
    if string_numbers.start_with?("//")
      new_delimitter = string_numbers[2]
    end
    new_delimitter
  end

  def add(string_numbers)
    return 0 if string_numbers.blank?

    delimitters = [",", "\n"]
    new_delimitter = fetch_new_delimitter(string_numbers)
    delimitters << new_delimitter if new_delimitter.present?

    regex_string = delimitters.join('|')
    regex_pattern = Regexp.new(regex_string)

    number_array = string_numbers.split(regex_pattern)
    number_array = number_array.map{|num| num.to_i}

    sum = 0
    negative_numbers = []
    number_array.each do |num|
      sum += num
      negative_numbers << num if num < 0
    end

    if negative_numbers.present?
      negative_nums = negative_numbers.join(", ")
      raise "negative numbers not allowed #{negative_nums}"
    end

    sum
  end
end
