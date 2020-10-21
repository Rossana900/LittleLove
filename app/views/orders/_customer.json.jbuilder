json.extract! order, :id, :first_name, :last_name, :product_name, :product_count, :created_at, :updated_at
json.url order_url(order, format: :json)