# Bank tech test

To use:
1. `git clone https://github.com/saypop/bank_tech_test.git`
2. `cd bank_tech_test`
3. `irb` then:

`
2.5.0 :001 > require './lib/account.rb'
 => true
2.5.0 :002 > account = Account.new
 => #<Account:0x00007fd9b391a048 @balance=0, @statement=#<Statement:0x00007fd9b391a020 @printout=["date || credit || debit || balance"]>>
2.5.0 :003 > account.deposit(1000)
 => ["date || credit || debit || balance", "08/05/2019 || 1000.0 ||  || 1000.0"]
2.5.0 :004 > account.withdraw(100)
 => ["date || credit || debit || balance", "08/05/2019 || 1000.0 ||  || 1000.0", "08/05/2019 ||  || 100.0 || 900.0"]
2.5.0 :005 > account.withdraw(150)
 => ["date || credit || debit || balance", "08/05/2019 || 1000.0 ||  || 1000.0", "08/05/2019 ||  || 100.0 || 900.0", "08/05/2019 ||  || 150.0 || 750.0"]
2.5.0 :006 > account.print_statement
date || credit || debit || balance
08/05/2019 || 1000.0 ||  || 1000.0
08/05/2019 ||  || 100.0 || 900.0
08/05/2019 ||  || 150.0 || 750.0
`

To test:
`rspec`

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Solution

OO design:
Account Class with:
- balance attribute;
- initialises with statement;
- deposit method;
- withdraw method;
Statement Class with:
- store method;
- print method;
Transaction Class?

1. Write user stories:

    `As a client of a bank
    So that I can add money to my account
    I can make a deposit`

    `As a client of a bank
    So that I can use my money
    I can make a withdrawal`

    `As a client of a bank
    So that I can see a record of my transactions
    I can print out a statement`

2. Write tests for Account Class:
    - initialises with balance of 0;
    - initialises with a statement;
    - has a deposit method that increases the balance;
    - has a deposit method that stores the transaction;
    - has a withdraw method that decreases the balance;
    - has a withdraw method that stores the transaction;
    - has a withdraw method that raises an error when funds are insufficient.

3. Write tests for Statement Class:
    - initialises with an blank statement;
    - stores transactions.

4. Write feature tests.
