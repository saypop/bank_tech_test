require_relative 'statement'
# This is the account class
class Account
  attr_reader :balance, :statement

  def initialize(statement_class = Statement)
    @balance = 0
    @statement = statement_class.new
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @balance += amount
    @statement.store(amount, date, balance = @balance, type = 'credit')
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    if amount > @balance
      raise "Insufficient funds. Your current balance is #{@balance}."
    end

    @balance -= amount
    @statement.store(amount, date, @balance, 'debit')
  end

  def print_statement
    @statement.printout.each do |line|
      puts line
    end
  end
end
