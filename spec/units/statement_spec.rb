require 'statement'

describe Statement do

  before :all do

    @statement = Statement.new

  end

  describe 'Intialization' do

    it 'has a blank printout' do

      expect(@statement.printout).to eq(["date || credit || debit || balance"])

    end

  end

  describe '.store' do

    it 'adds a new transaction to the printout' do

      expect{@statement.store(10, "07/05/2019", 90, "debit")}.to change{@statement.printout[1]}.from(nil).to("07/05/2019 ||  || 10.0 || 90.0")

    end

  end

end
