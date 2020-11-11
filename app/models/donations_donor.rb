class DonationsDonor < ApplicationRecord
    belongs_to :donation
    belongs_to :donor
end