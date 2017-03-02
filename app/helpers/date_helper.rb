module DateHelper
  def find_date(date)
    if date
      begin
        DateTime.strptime(date, '%m/%d/%Y')
      rescue ArgumentError
        DateTime.now.to_date
      end
    else
      DateTime.now.to_date
    end
  end

  def format_time(datetime)
    datetime.strftime("%-I:%M %p")
  end

  def format_date(datetime)
    datetime.strftime('%-m/%-d/%Y')
  end

  def convert_to_date(input)
    DateTime.strptime(input, '%m/%d/%Y %I:%M %p')
  end
end
