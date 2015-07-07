require "chinese_numbers_characters_converter/version"

module ChineseNumbersCharactersConverter
  class Converter
  	
  	def self.run(str)
  		number = ["零", "壹", "貳", "參", "肆", "伍", "陸", "柒", "捌", "玖"]
			dig = ["", "拾", "佰", "仟", "萬", "拾", "佰", "仟", "億", "拾", "佰", "仟"]
  		@string_a = Array.new
  		@num_o = str
  		num_s = str.to_s
  		num_s = num_s.reverse!
  		for i in 0..(num_s.to_s).length-1
      	if ((num_s[i]).to_i != 0)
        	@string_a.push(number[(num_s[i]).to_i] + dig[i])
      	end
    	end
    	if @string_a.any?
      	@string_a = @string_a.reverse!()
      	@string_a.push("元整")
    	end
    	@num_o = num_s.reverse!
    	return @string_a.join
  	end
  
  end
end
