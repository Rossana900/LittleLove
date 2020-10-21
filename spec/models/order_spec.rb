require 'rails_helper'

RSpec.describe Order, type: :model do
  subject do
    customer = Customer.create(first_name: "Rossana", last_name: "Godfrey", email: "a@b.com", phone: "1234567890")
    Order.new(product_name: "Pants", product_count: 3, customer_id: customer.id)
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  it "is not valid with number in the product name" do
    subject.product_name="shield1"
    expect(subject).to_not be_valid
  end
end 
  
  


