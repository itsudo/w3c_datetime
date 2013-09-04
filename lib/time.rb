class Time
  def to_w3c_datetime
	strftime '%Y-%m-%dT%H:%M:%S' + strftime('%z').insert(3, ':')
  end
end