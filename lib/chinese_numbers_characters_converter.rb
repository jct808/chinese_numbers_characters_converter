# encoding: utf-8

require "chinese_numbers_characters_converter/version"

NUMBERS = ["零", "壹", "貳", "參", "肆", "伍", "陸", "柒", "捌", "玖"]
UNITS = ["", "拾", "佰", "仟", "萬", "拾", "佰", "仟", "億", "拾", "佰", "仟"]

module ChineseNumbersCharactersConverter
  class Converter
    def self.run(input_num)
      return unless input_num
      result = []

      # 12345 => 54321
      input_num = input_num.to_s.reverse!

      # convert to kanji
      input_num.split('').each_with_index do |n, i|
        result.push NUMBERS[n.to_i] + UNITS[i]
      end

      # 54321 kanji => 12345 kanji
      result.reverse!
      result.push("元整")
      return result.join
    end
  end
end
