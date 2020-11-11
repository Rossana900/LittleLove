class Donation < ApplicationRecord
  has_many :donations_donors
  has_many :donors, through: :donations_donors

  validates :product_count, presence: true
  validate :product_name_validity
  
  def product_name_validity
    if self.product_name.nil?
      errors.add(:product_name, "can not be empty")
    elsif self.product_name.count("0-9") > 0
      errors.add(:product_name, "can not include numbers")
    end
  end  
end


