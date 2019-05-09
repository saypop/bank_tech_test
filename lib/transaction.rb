# This is the transaction class
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date, credit = nil, debit = nil, balance)
    @date = date
    unless credit.nil?
      @credit = credit
      @credit = format('%.2f', credit)
    end
    unless debit.nil?
      @debit = debit
      @debit = format('%.2f', debit)
    end
    @balance = format('%.2f', balance)
  end
end
