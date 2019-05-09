# This is the statement class
class Statement
  attr_reader :printout

  def initialize
    @printout = 'date || credit || debit || balance'
  end

  def print_statement(transactions)
    puts compile_statement(transactions)
  end

  def compile_statement(transactions)
    compiled_statement = @printout << "\n"
    transactions.each do |transaction|
      compiled_statement << "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
    return compiled_statement
  end
end
