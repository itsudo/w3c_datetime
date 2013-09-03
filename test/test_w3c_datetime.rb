require 'test/unit'
require 'w3c_datetime'

class W3cDatetimeTest < Test::Unit::TestCase
  def test_parse_date
    assert_equal W3cDatetime::parse('2013-02-10'), Time.new(2013,02,10)
  end

  def test_parse_date_with_hour_and_minute
    assert_equal W3cDatetime::parse('2013-02-10T10:10'), Time.new(2013,02,10,10,10)
  end

  def test_parse_date_with_time
    assert_equal W3cDatetime::parse('2013-02-10T10:10:20'), Time.new(2013,02,10,10,10,20)
  end

  def test_parse_date_with_time_and_milisecond
    assert_equal W3cDatetime::parse('2013-02-10T10:10:20.30'), Time.new(2013,02,10,10,10,20)
  end

  def test_parse_date_with_hour_and_minute_and_timezone_as_offset
    assert_equal W3cDatetime::parse('2013-02-10T10:10+10:30'),  Time.new(2013,02,10,10,10,nil,'+10:30')
  end

end
