class Bank
  attr_reader :balance, :transactions

  def credit(amount)
    @balance += amount
    @transactions << [Time.now, amount, 0, @balance]
  end

  def debit(amount)
    @balance -= amount
    @transactions << [Time.now, 0, amount, @balance]
  end

  def print_statement
    p "date       || credit   || debit   ||   balance"
    transactions.reverse.each do |transaction|
      transaction[0] = pretty_time(transaction[0])
      p transaction.join("  ||  ")
    end
  end

private

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def show_balance
    p @balance
  end

end

def pretty_time(time)
  time.strftime("%d/%m/%Y")
end
