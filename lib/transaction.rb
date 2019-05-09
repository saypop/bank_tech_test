# This is the transaction class
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date, credit = nil, debit = nil, balance)
    @date = date
    @credit = credit
    @credit = format('%.2f', credit) unless credit.nil?
    @debit = debit
    @debit = format('%.2f', debit) unless debit.nil?
    @balance = format('%.2f', balance)
  end
end
