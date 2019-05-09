def test_setup
  @statement_double = double('statement', store: nil)
  @statement_class_double = double('Statement', new: @statement_double)
  @transaction_double = double('transaction')
  @transaction_class_double = double('Transaction', :new => @transaction_double)
  @account = described_class.new
end

def top_up
  @account.deposit(100, @transaction_class_double)
end
