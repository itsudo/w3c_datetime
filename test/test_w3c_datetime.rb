require 'minitest/spec'
require 'minitest/autorun'
require 'w3c_datetime'

describe W3cDatetime do
  it "does not parse rubbish" do
    W3cDatetime::parse('ala ma kota').must_be_nil
    W3cDatetime::parse('2012-03-20 ala ma kota').must_be_nil
    W3cDatetime::parse('sth stupid2012-03-20').must_be_nil
    W3cDatetime::parse('2012-03-20T99:00:99').must_be_nil
    W3cDatetime::parse('2012-13-20').must_be_nil
    W3cDatetime::parse('2012-12-20T10:10+25:00').must_be_nil
  end

  it "returns Time object" do
    W3cDatetime::parse('2013-02-10').must_be_instance_of Time
  end

  it "parses date" do
    W3cDatetime::parse('2013-02-10').must_equal Time.new(2013,02,10)
  end

  it "parses date with hour and minute" do
    W3cDatetime::parse('2013-02-10T10:10').must_equal Time.new(2013,02,10,10,10)
  end

  it "parses date with time" do
    W3cDatetime::parse('2013-02-10T10:10:20').must_equal Time.new(2013,02,10,10,10,20)
  end

  it "parses date with time and timezone" do
    W3cDatetime::parse('2013-02-10T10:10:20+10:00').must_equal Time.new(2013,02,10,10,10,20, '+10:00')
  end

  it "parses date with time and Zulu offset" do
    W3cDatetime::parse('2013-02-10T10:10:20Z').must_equal Time.new(2013,02,10,10,10,20, '+00:00')
  end

  it "parses date with time and miliseconds" do
    W3cDatetime::parse('2013-02-10T10:10:20.30').must_equal Time.new(2013,02,10,10,10,20)
  end

  it "parses date with hour and minute and offset" do
    W3cDatetime::parse('2013-02-10T10:10+10:30').must_equal Time.new(2013,02,10,10,10,nil,'+10:30')
  end

  it "parses date with time and offset" do
    W3cDatetime::parse('2013-02-10T10:10:10+10:30').must_equal Time.new(2013,02,10,10,10,10,'+10:30')
  end

  it "parses date with time and miliseconds and offset" do
    W3cDatetime::parse('2013-02-10T10:10:10.30+10:30').must_equal Time.new(2013,02,10,10,10,10,'+10:30')
  end

  it "parses date with time and miliseconds and Zulu offset" do
    W3cDatetime::parse('2013-02-10T10:10:10.30Z').must_equal Time.new(2013,02,10,10,10,10,'+00:00')
  end
end
