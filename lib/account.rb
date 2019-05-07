class Account

  attr_reader :balance, :statement

  def initialize(statement_class = Statement)
    @balance = 0
    @statement = statement_class.new
  end

end
