require_relative "../account"

describe "Account" do
  it "should update the account balance" do
    account = Account.new(78943024973456281, 500.00)
    expect(account.update_balance(500.00)).to eq (1000.00)
  end

  it "check the transaction is valid when there is enough balance" do
    account = Account.new(78943024973456282, 1000.00)
    expect(account.valid_transfer?(500.00)).to be true
  end

  it "check the transaction is not valid when there is no enough balance" do
    account = Account.new(78943024973456283, 400.00)
    expect(account.valid_transfer?(500.00)).to be false
  end

  it "check the transaction is valid for full balance transaction" do
    account = Account.new(78943024973456283, 444.00)
    expect(account.valid_transfer?(444.00)).to be true
  end
end
