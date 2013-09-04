class Time
  def to_w3c_datetime
	strftime '%Y-%m-%dT%H:%M:%S%:z'
  end
end