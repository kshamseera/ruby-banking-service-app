require_relative "../company"

describe "Company" do
  it "should create transaction" do
    account1 = Account.new(6789654378902345, 1000)
    account2 = Account.new(6789654378902346, 5000)
    account3 = Account.new(6789654378902347, 500)
    accounts = [account1, account2, account3]
    company = Company.new(accounts)

    transaction1 = company.createTransaction(6789654378902345, 6789654378902346, 500)

    expect(transaction1.source).to eq (account1)
    expect(transaction1.destination).to eq (account2)
    expect(transaction1.amount).to eq (500)
  end

  it "should process transaction - with all valid transactions" do
    account1 = Account.new(6789654378902345, 1000)
    account2 = Account.new(6789654378902346, 5000)
    account3 = Account.new(6789654378902347, 500)
    accounts = [account1, account2, account3]
    company = Company.new(accounts)
    transaction1 = company.createTransaction(6789654378902345, 6789654378902346, 500)
    transaction2 = company.createTransaction(6789654378902346, 6789654378902347, 1000)
    transaction3 = company.createTransaction(6789654378902347, 6789654378902345, 250)
    transactions = [transaction1, transaction2, transaction3]

    company.process_transactions(transactions)

    expect(account1.balance).to eq(750) # 1000-500+250
    expect(account2.balance).to eq(4500) # 5000+500-1000
    expect(account3.balance).to eq(1250) # 500+1000-250
  end

  it "should process transaction - with some invalid transcations" do
    account1 = Account.new(6789654378902345, 1000)
    account2 = Account.new(6789654378902346, 5000)
    account3 = Account.new(6789654378902347, 500)
    accounts = [account1, account2, account3]
    company = Company.new(accounts)
    transaction1 = company.createTransaction(6789654378902345, 6789654378902346, 2000)
    transaction2 = company.createTransaction(6789654378902346, 6789654378902347, 1000)
    transaction3 = company.createTransaction(6789654378902347, 6789654378902345, 250)
    transactions = [transaction1, transaction2, transaction3]

    company.process_transactions(transactions)

    expect(account1.balance).to eq(1250) # 1000-0(Invalid)+250
    expect(account2.balance).to eq(4000) # 5000+0(Invalid)-1000
    expect(account3.balance).to eq(1250) # 500+1000-250
  end
end
