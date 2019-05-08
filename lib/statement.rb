class Statement

  attr_reader :printout

  def initialize
    @printout = ["date || credit || debit || balance"]
  end

  def store(amount, date, balance, type)
    amount, balance = amount.to_f, balance.to_f
    line = "#{ date } || #{ amount if type == 'credit' } || #{ amount if type == 'debit' } || #{ balance }"
    @printout << line
  end

end
