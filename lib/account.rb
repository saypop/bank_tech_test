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

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Insufficient funds. Your current balance is #{@balance}." if amount > @balance
    @balance -= amount
    @statement.store(amount, date, @balance, "debit")
  end

end
