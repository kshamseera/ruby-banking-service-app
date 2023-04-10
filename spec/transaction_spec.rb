require_relative "../transaction"
require_relative "../account"

describe "Transfer" do
  it "execute transaction should update account balance" do
    source = Account.new(1111234522226789, 5000)
    destination = Account.new(1212343433335665, 1000)
    transaction = Transaction.new(source, destination, 500)

    expect(source).to receive(:update_balance).with(-500)
    expect(destination).to receive(:update_balance).with(500)

    transaction.execute()
  end

  it "valid transaction check should call account valid transfer " do
    source = Account.new(1111234522226789, 5000)
    destination = Account.new(1212343433335665, 1000)
    transaction = Transaction.new(source, destination, 500)

    expect(source).to receive(:valid_transfer?).with(500)

    transaction.valid?()
  end
end
