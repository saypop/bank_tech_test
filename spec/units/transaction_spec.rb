require 'transaction'

describe Transaction do

  before :all do
    @subject = Transaction.new("12/03/2019", 100.00, nil, 150.00)
  end

  describe 'Intialization' do
    it 'has a readable date attribute' do
      expect(@subject.date).to eq("12/03/2019")
    end
    it 'has a readable credit attribute' do
      expect(@subject.credit).to eq(100.00)
    end
    it 'has a readable debit attribute' do
      expect(@subject.debit).to eq(nil)
    end
    it 'has a readable balance attribute' do
      expect(@subject.balance).to eq(150.00)
    end
  end

end
