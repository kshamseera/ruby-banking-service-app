class Account
  attr_reader :number, :balance

  def initialize(number, balance)
    @number = number
    @balance = balance
  end

  def update_balance(amount)
    @balance += amount
  end

  def valid_transfer?(amount)
    @balance - amount >= 0
  end
end
