require 'minitest/spec'
require 'minitest/autorun'
require 'w3c_datetime'

describe Time do
  describe '#to_w3c_datetime' do
  	it 'should return string representing time in W3C date time format' do
  	  t = Time.new
  	  
  	  t.must_be_within_delta W3cDatetime::parse(t.to_w3c_datetime), 1
  	end
  end	
end