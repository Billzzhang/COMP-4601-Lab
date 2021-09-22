json.extract! product, :id, :name, :price, :dimensions, :stock, :created_at, :updated_at, :reviews
json.url product_url(product, format: :json)
