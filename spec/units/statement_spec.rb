require 'statement'

describe Statement do
  before :all do
    @statement = Statement.new
  end

  describe 'Intialization' do
    it 'has a blank printout' do
      expect(@statement.printout).to eq(['date || credit || debit || balance'])
    end
  end

  describe '.print_statement' do
    it 'prints out a blank statement' do
      transactions_double = []
      expect { @statement.print_statement(transactions_double) }.to output(
        "date || credit || debit || balance\n"
      ).to_stdout
    end

    it 'prints out a statement with transactions' do
      transaction_double = double(
        'transaction',
        date: '01/01/2019',
        credit: '100.00',
        debit: nil,
        balance: '200.00'
      )
      transactions_double = [transaction_double]
      expect { @statement.print_statement(transactions_double) }.to output(
        "date || credit || debit || balance\n01/01/2019 || 100.00 ||  || 200.00\n"
      ).to_stdout
    end
  end
end
