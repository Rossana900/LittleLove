FactoryBot.define do
  factory :donation do
    product_name { "MyString" }
    product_count { 1 }
    donor { nil }
  end
end
