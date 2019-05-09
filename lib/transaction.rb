# This is the transaction class
class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(date, credit = nil, debit = nil, balance)
    @date = date
    @credit, @credit = credit, '%.2f' % credit if credit != nil
    @debit, @debit = debit, '%.2f' % debit if debit != nil
    @balance = '%.2f' % balance
  end

end
