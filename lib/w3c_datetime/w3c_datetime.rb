# Handle W3 Date and Time formats
#
# Handle W3 Date and Time formats as specified in http://www.w3.org/TR/NOTE-datetime
#
# @see http://www.w3.org/TR/NOTE-datetime
#
# @example
#   W3cDateTime::parse('2013-02-10')
#   W3cDateTime::parse('2013-02-10T10:10Z')
#   W3cDateTime::parse('2013-02-10T10:10:20+10:00')
#
# @author Michal Pawlowski <misza222@gmail.com>
class W3cDatetime

  # Parse date string in http://www.w3.org/TR/NOTE-datetime format
  #
  # @param [String] date_str date represented as string in http://www.w3.org/TR/NOTE-datetime format
  # @return [Time] Time object
  def self.parse(date_str)
    date_regexp = /^(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})(?:T(?<hour>\d{2}):(?<minute>\d{2}):?(?<second>\d{2})?\.?(?<milisecond>\d{1,2})?(?:(?<timezone>.+)|Z)?)?$/
    parsed = date_regexp.match(date_str)
    begin
      Time.new(parsed[:year].to_i, parsed[:month].to_i, parsed[:day].to_i, parsed[:hour].to_i, parsed[:minute].to_i, parsed[:second].to_i, get_timezone(parsed[:timezone])) unless parsed.nil?
    rescue ArgumentError, TypeError
    end
  end

  class << self
    private
    def get_timezone(timezone)
      if timezone == 'Z'
        timezone = '+00:00'
      elsif timezone == ''
        timezone = nil
      end

      timezone
    end
  end
end
