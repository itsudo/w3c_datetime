class W3cDatetime
  def self.parse(date_str)
    date_regexp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})(?:T(?<hour>\d{2}):(?<minute>\d{2}):?(?<second>\d{2})?\.?(?<milisecond>\d{1,2})?(?<timezone>.+)?)?/
    parsed = date_regexp.match(date_str)
    begin
      Time.new(parsed[:year].to_i, parsed[:month].to_i, parsed[:day].to_i, parsed[:hour].to_i, parsed[:minute].to_i, parsed[:second].to_i, self.get_timezone(parsed[:timezone])) unless parsed.nil?
    rescue ArgumentError, TypeError
    end
  end

  def self.get_timezone(timezone)
    timezone || "+00:00"
  end
end
