require 'bank'

describe Bank do

  subject { Bank.new }

  it 'has a default starting balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'starts with no transactions' do
    expect(subject.transactions).to be_empty
  end

  describe '#credit' do
    before(:each) { subject.credit(1000.00) }
    it 'makes a credit' do
      expect(subject.balance).to eq 1000.00
    end

    it 'adds a transaction' do
      expect(subject.transactions.length).to eq 1
    end
  end

  describe '#debit' do
    before(:each) { subject.debit(500.00) }
    it 'makes a debit' do
      expect(subject.balance).to eq -500.00
    end

    it 'adds a transaction' do
      expect(subject.transactions.length).to eq 1
    end
  end

  describe '#print_statement' do
    before(:each) { subject.credit(1000.00) }
    sleep(0.1)
    before(:each) { subject.debit(500.00) }
  end
end
