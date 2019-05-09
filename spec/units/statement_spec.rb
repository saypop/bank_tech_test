require 'statement'

describe Statement do
  before :all do
    @statement = described_class.new
  end

  describe 'Intialization' do
    it 'has a blank printout' do
      expect(subject.printout).to eq('date || credit || debit || balance')
    end
  end

  describe '.compile_statement' do
    it 'returns a statement with transactions' do
      transaction_double = double(
        'transaction',
        date: '01/01/2019',
        credit: '100.00',
        debit: nil,
        balance: '200.00'
      )
      transactions_double = [transaction_double]
      expect(subject.compile_statement(transactions_double)).to eq(
        "date || credit || debit || balance\n01/01/2019 || 100.00 ||  || 200.00\n"
      )
    end
  end


  describe '.print_statement' do
    it 'prints out a blank statement' do
      transactions_double = []
      expect { subject.print_statement(transactions_double) }.to output(
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
      expect { subject.print_statement(transactions_double) }.to output(
        "date || credit || debit || balance\n01/01/2019 || 100.00 ||  || 200.00\n"
      ).to_stdout
    end
  end
end
