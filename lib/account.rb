class Account

  attr_reader :balance, :statement

  def initialize(statement_class = Statement)
    @balance = 0
    @statement = statement_class.new
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount
    @statement.store(amount, date, balance = @balance, type = "credit")
  end



end
