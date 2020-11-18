json.extract! donation, :id, :first_name, :last_name, :product_name, :product_count, :created_at, :updated_at
json.url donation_url(donation, format: :json)