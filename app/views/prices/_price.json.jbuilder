json.extract! price, :id, :open_price, :highest_price, :lowest_price, :volume, :close_price, :date, :created_at, :updated_at
json.url price_url(price, format: :json)
