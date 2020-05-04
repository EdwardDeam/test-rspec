require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:store) { Store.new }
  subject { Product.new(name: 'Test Product', category: 'Widget', price: 500, store: store) }

  context 'associations' do
    it 'belongs to Store' do
      relation = Product.reflect_on_association(:store) # Association name
      expect(relation.macro).to eql(:belongs_to) # expect type
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid 
    end

    it 'is not valid with a name less than five characters' do
      subject.name = 'abcd'
      expect(subject).to_not be_valid 
    end

    it 'is not valid with a name greater than twenty-nine characters' do
      subject.name = 'a'*30
      expect(subject).to_not be_valid 
    end

    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).to_not be_valid 
    end

    it 'is not valid with a price less than one cent' do
      subject.price = 0
      expect(subject).to_not be_valid 
    end

    it 'is not valid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid 
    end

    it 'is not valid with a name less than five characters' do
      subject.category = 'abcd'
      expect(subject).to_not be_valid 
    end

    it 'is not valid with a name greater than twenty-five characters' do
      subject.category = 'a'*25
      expect(subject).to_not be_valid 
    end
  end

  context '#display_currency' do
    it 'converts the price to the string format' do
      expect(subject.display_currency).to eql('$5.00')
    end
  end
end
