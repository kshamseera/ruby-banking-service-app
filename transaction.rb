class Transaction
  attr_reader :source, :destination, :amount

  def initialize(source, destination, amount)
    @source = source
    @destination = destination
    @amount = amount
  end

  def execute
    @source.update_balance(-@amount)
    @destination.update_balance(@amount)
  end

  def valid?
    @source.valid_transfer?(@amount)
  end
end
