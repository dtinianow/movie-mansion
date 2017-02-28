require 'rails_helper'

describe DateHelper do
  describe '#find_date' do
    it 'returns a datetime for a valid date' do
      date = DateTime.strptime('3/1/2017', '%m/%d/%Y')
      expect(helper.find_date('3/1/2017')).to eql(date)
    end

    it 'returns a default datetime of today if argument is nil' do
      date = DateTime.now.to_date
      expect(helper.find_date(nil)).to eql(date)
    end
  end
end
