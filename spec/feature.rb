require './lib/bank.rb'

bank = Bank.new
bank.credit(1000.00)
sleep(1)
bank.debit(500.00)
bank.print_statement
