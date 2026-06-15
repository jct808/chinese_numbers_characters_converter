# frozen_string_literal: true

require "chinese_number/version"

module ChineseNumber
  def self.convert(input_num)
    Converter.run(input_num)
  end

  class Converter
    NUMBERS = %w[零 壹 貳 參 肆 伍 陸 柒 捌 玖].freeze
    DIGIT_UNITS = ["", "拾", "佰", "仟"].freeze
    SECTION_UNITS = ["", "萬", "億", "兆", "京"].freeze
    INTEGER_PATTERN = /\A[+-]?\d+\z/.freeze

    def self.run(input_num)
      return unless input_num

      normalized = normalize(input_num)
      sign = normalized.delete_prefix!("-") ? "負" : ""
      normalized.delete_prefix!("+")
      normalized = normalized.sub(/\A0+/, "")

      return "#{sign}零元整" if normalized.empty?

      groups = normalized.reverse.scan(/\d{1,4}/).map { |group| group.reverse.to_i }
      raise ArgumentError, "number is too large to convert" if groups.length > SECTION_UNITS.length

      converted_groups = groups.each_with_index.map do |group, index|
        next if group.zero?

        group_to_chinese(group) + SECTION_UNITS[index]
      end

      result = []
      pending_zero = false

      converted_groups.reverse.each_with_index do |group, index|
        original_group = groups.reverse[index]

        if group
          result << NUMBERS[0] if pending_zero || (index.positive? && original_group < 1000)
          result << group
          pending_zero = false
        elsif result.any?
          pending_zero = true
        end
      end

      "#{sign}#{result.join}元整"
    end

    def self.normalize(input_num)
      normalized = input_num.to_s.strip
      raise ArgumentError, "input must be an integer" unless normalized.match?(INTEGER_PATTERN)

      normalized
    end
    private_class_method :normalize

    def self.group_to_chinese(group)
      result = []
      pending_zero = false

      group.digits.each_with_index.reverse_each do |digit, index|
        if digit.zero?
          pending_zero = true if result.any?
          next
        end

        result << NUMBERS[0] if pending_zero
        result << NUMBERS[digit] + DIGIT_UNITS[index]
        pending_zero = false
      end

      result.join
    end
    private_class_method :group_to_chinese
  end
end
