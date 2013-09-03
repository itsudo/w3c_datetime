class W3cDatetime
  def self.parse(date_str)
    date_regexp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})(?:T(?<hour>\d{2}):(?<minute>\d{2}):?(?<second>\d{2})?\.?(?<milisecond>\d{1,2})?(?<timezone>.+)?)?/
    parsed = date_regexp.match(date_str)
    Time.new(parsed[:year], parsed[:month], parsed[:day], parsed[:hour], parsed[:minute], parsed[:second], self.get_timezone(parsed[:timezone])) unless parsed.nil?
  end

  def self.get_timezone(timezone)
    timezone || "+00:00"
  end
end
