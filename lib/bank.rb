class Bank
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = {}
  end

  def credit(amount)
    @balance += amount
    @transactions[Time.now.strftime("%d/%m/%Y")] = amount
  end

  def debit(amount)
    @balance -= amount
    @transactions[Time.now.strftime("%d/%m/%Y")] = -amount
  end

end
