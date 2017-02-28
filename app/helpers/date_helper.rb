module DateHelper
  def find_date(date)
    if date
      DateTime.strptime(date, '%m/%d/%Y')
    else
      DateTime.now.to_date
    end
  end
end
