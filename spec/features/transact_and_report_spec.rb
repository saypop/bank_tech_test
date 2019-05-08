require 'account'

describe 'Basic Account Functions' do

  it 'opens an account' do
    account = Account.new
    expect(account).to be
  end

  it 'prints a blank statement' do
    expect{ Account.new.print_statement }.to output("date || credit || debit || balance\n").to_stdout
  end 

  it 'makes a deposit and prints statement' do
    account = Account.new
    account.deposit(1000, '08/05/2019')
    expect{ account.print_statement }.to output("date || credit || debit || balance\n08/05/2019 || 1000.0 ||  || 1000.0\n").to_stdout
  end

  it 'makes a withdrawal and prints statement' do
    account = Account.new
    account.deposit(1000, '08/05/2019')
    account.withdraw(100, '08/05/2019')
    expect{ account.print_statement }.to output("date || credit || debit || balance\n08/05/2019 || 1000.0 ||  || 1000.0\n08/05/2019 ||  || 100.0 || 900.0\n").to_stdout
  end

end