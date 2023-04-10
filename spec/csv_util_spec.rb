require_relative "../csv_util"
require_relative "../company"

describe "CsvUtil" do
  it "should loadAccounts" do
    accounts = CsvUtil.loadAccounts("data/accounts.csv")
    expect(accounts[0].number).to eq(1234567890123456)
    expect(accounts[0].balance).to eq(1000)
    expect(accounts[1].number).to eq(2345678901234567)
    expect(accounts[1].balance).to eq(5000)
    expect(accounts[2].number).to eq(3456789012345678)
    expect(accounts[2].balance).to eq(750)
  end

  it "should loadTransactions" do
    account1 = Account.new(1234567890123456, 1000)
    account2 = Account.new(2345678901234567, 5000)
    account3 = Account.new(3456789012345678, 500)
    accounts = [account1, account2, account3]
    company = Company.new(accounts)

    transactions = CsvUtil.loadTransactions(company, "data/transactions.csv")

    expect(transactions[0].source.number).to eq(1234567890123456)
    expect(transactions[0].destination.number).to eq(2345678901234567)
    expect(transactions[0].amount).to eq(500)
    expect(transactions[1].source.number).to eq(2345678901234567)
    expect(transactions[1].destination.number).to eq(3456789012345678)
    expect(transactions[1].amount).to eq(1000)
    expect(transactions[2].source.number).to eq(3456789012345678)
    expect(transactions[2].destination.number).to eq(1234567890123456)
    expect(transactions[2].amount).to eq(250)
  end
end
