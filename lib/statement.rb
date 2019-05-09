# This is the statement class
class Statement
  attr_reader :printout

  def initialize
    @printout = ['date || credit || debit || balance']
  end

  def store(amount, date, balance, type)
    amount = '%.2f' % amount
    balance = '%.2f' % balance
    line = "#{date} || #{amount if type == 'credit'} || #{amount if type == 'debit'} || #{balance}"
    @printout << line
  end
end
