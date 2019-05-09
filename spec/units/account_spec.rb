require 'account'
require 'test_helpers'

describe Account do
  describe 'Intialization' do
    it 'has a balance of 0' do
      test_setup
      expect(@account.balance).to eq(0)
    end

    it 'has an empty transactions array' do
      test_setup
      expect(@account.transactions).to eq([])
    end
  end

  describe '.deposit' do
    it 'increases the balance' do
      test_setup
      expect { @account.deposit(10, @transaction_class_double) }.to change { @account.balance }.by(10)
    end

    it 'creates a transaction' do
      test_setup
      expect(@transaction_class_double).to receive(:new).with(
        '07/05/2019', 10, nil, 10
      )
      @account.deposit(10, @transaction_class_double, '07/05/2019')
    end

    it 'stores a transaction' do
      test_setup
      expect do
        @account.deposit(10, @transaction_class_double, '07/05/2019')
      end.to change { @account.transactions }.from([]).to([@transaction_double])
    end
  end

  describe '.withdraw' do
    it 'decreases the balance' do
      test_setup
      top_up
      expect { @account.withdraw(10, @transaction_class_double) }.to change {
        @account.balance
      }.by(-10)
    end

    it 'creates a transaction' do
      test_setup
      top_up
      expect(@transaction_class_double).to receive(:new).with(
        '07/05/2019', nil, 10, 90
      )
      @account.withdraw(10, @transaction_class_double, '07/05/2019')
    end

    it 'stores a transaction' do
      test_setup
      top_up
      expect do
        @account.withdraw(10, @transaction_class_double, '07/05/2019')
      end.to change { @account.transactions }.from([@transaction_double]).to(
        [@transaction_double, @transaction_double]
      )
    end

    it 'raises an error when funds are less than withdraw amount' do
      test_setup
      expect { @account.withdraw(10) }.to raise_error(
        'Insufficient funds. Your current balance is 0.'
      )
    end
  end

  describe '.print_statement' do
    it 'prints a statement' do
      test_setup
      expect(@statement_double).to receive(:print_statement).with([])
      @account.print_statement(@statement_double)
    end
  end
end
