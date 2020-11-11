require 'rails_helper'

RSpec.describe Donation, type: :model do
  subject do
    donor = Donor.create(first_name: "Rossana", last_name: "Godfrey", email: "a@b.com", phone: "1234567890")
    Donation.new(product_name: "Diapers", product_count: 3, donor_id: donor.id)
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
  
  


