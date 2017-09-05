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
    before(:each) { subject.credit(1000) }
    it 'makes a credit' do
      expect(subject.balance).to eq 1000
    end

    it 'adds a transaction' do
      expect(subject.transactions).to have_value(1000)
      expect(subject.transactions).to have_key(Time.now.strftime("%d/%m/%Y"))
    end
  end

  describe '#debit' do
    before(:each) { subject.debit(500) }
    it 'makes a debit' do
      expect(subject.balance).to eq -500
    end

    it 'adds a transaction' do
      expect(subject.transactions).to have_value(-500)
      expect(subject.transactions).to have_key(Time.now.strftime("%d/%m/%Y"))
    end
  end
end
