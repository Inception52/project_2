json.extract! house, :id, :company_id, :location, :square_footage, :year, :style, :price, :floors, :basement, :owner, :contact, :created_at, :updated_at
json.url house_url(house, format: :json)
