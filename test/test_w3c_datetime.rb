require 'minitest/spec'
require 'minitest/autorun'
require 'w3c_datetime'

describe W3cDatetime do
  it "parses date" do
    W3cDatetime::parse('2013-02-10').must_equal Time.new(2013,02,10)
  end

  it "parses date with hour and minute" do
    W3cDatetime::parse('2013-02-10T10:10').must_equal Time.new(2013,02,10,10,10)
  end

  it "parses date with time" do
    W3cDatetime::parse('2013-02-10T10:10:20').must_equal Time.new(2013,02,10,10,10,20)
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
end
