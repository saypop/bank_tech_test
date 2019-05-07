require 'account'

describe Account do

    describe 'Intialization' do

      before(:all) do
        RSpec::Mocks.with_temporary_scope do
          @statement_double = double('statement')
          @statement_class_double = double('Statement', :new => @statement_double)
          @account = described_class.new(@statement_class_double)
        end
      end

      it 'has a balance of 0' do
        expect(@account.balance).to eq(0)
      end

      it 'creates a statement object' do
        expect(@account.statement).to eq(@statement_double)
      end

    end

end
