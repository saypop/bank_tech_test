require 'account'

describe Account do

    def test_setup
      @statement_double = double('statement', :store => nil)
      @statement_class_double = double('Statement', :new => @statement_double)
      @account = described_class.new(@statement_class_double)
    end

    def top_up
      @account.deposit(100)
    end

    describe 'Intialization' do

      it 'has a balance of 0' do
        test_setup
        expect(@account.balance).to eq(0)
      end

      it 'creates a statement object' do
        test_setup
        expect(@account.statement).to eq(@statement_double)
      end

    end

    describe '.deposit' do

      it 'increases the balance' do
        test_setup
        expect{@account.deposit(10)}.to change{@account.balance}.by(10)
      end

      it 'stores the transaction in statement' do
        test_setup
        expect(@statement_double).to receive(:store).with(10, "7/5/2019", 10, "credit")
        @account.deposit(10, "7/5/2019")
      end

    end

    describe '.withdraw' do

      it 'decreases the balance' do
        test_setup
        top_up
        expect{@account.withdraw(10)}.to change{@account.balance}.by(-10)
      end

      it 'stores the transaction in statement' do
        test_setup
        top_up
        expect(@statement_double).to receive(:store).with(10, "7/5/2019", 90, "debit")
        @account.withdraw(10, "7/5/2019")
      end

      it 'raises an error when funds are less than withdraw amount' do 
        test_setup
        expect{@account.withdraw(10)}.to raise_error("Insufficient funds. Your current balance is 0.")
      end

    end

end
