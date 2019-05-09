require_relative 'statement'
require_relative 'transaction'
# This is the account class
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, transaction_class = Transaction, date = Time.now.strftime('%d/%m/%Y'))
    @balance += amount
    @transactions << transaction_class.new(date, amount, nil, @balance)
  end

  def withdraw(amount, transaction_class = Transaction, date = Time.now.strftime('%d/%m/%Y'))
    if amount > @balance
      raise "Insufficient funds. Your current balance is #{@balance}."
    end

    @balance -= amount
    @transactions << transaction_class.new(date, nil, amount, @balance)
  end

  def print_statement(statement = Statement.new)
    statement.print_statement(@transactions)
  end
end
