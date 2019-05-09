# This is the statement class
class Statement
  attr_reader :printout

  def initialize
    @printout = ['date || credit || debit || balance']
  end

  def print_statement(transactions)
    puts @printout
    transactions.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end
end
