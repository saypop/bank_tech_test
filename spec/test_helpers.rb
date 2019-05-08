def test_setup
  @statement_double = double('statement', :store => nil)
  @statement_class_double = double('Statement', :new => @statement_double)
  @account = described_class.new(@statement_class_double)
end

def top_up
  @account.deposit(100)
end
