require 'test_helper'

class ChineseNumberTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ChineseNumber::VERSION
  end

  def test_convert_integer_to_financial_chinese
    assert_equal '貳佰壹拾參萬壹仟貳佰參拾壹元整',
                 ChineseNumber.convert(2_131_231)
  end

  def test_converts_zero
    assert_equal '零元整', ChineseNumber.convert(0)
  end

  def test_omits_redundant_zeroes_and_units
    assert_equal '壹仟元整', ChineseNumber.convert(1000)
    assert_equal '壹仟零壹元整', ChineseNumber.convert(1001)
    assert_equal '壹萬零壹元整', ChineseNumber.convert(10_001)
    assert_equal '壹億零壹元整', ChineseNumber.convert(100_000_001)
  end

  def test_accepts_integer_strings
    assert_equal '壹拾貳萬參仟肆佰伍拾陸元整',
                 ChineseNumber.convert('00123456')
  end

  def test_returns_nil_for_nil
    assert_nil ChineseNumber.convert(nil)
  end

  def test_rejects_non_integer_input
    assert_raises(ArgumentError) do
      ChineseNumber.convert('12.5')
    end
  end
end
