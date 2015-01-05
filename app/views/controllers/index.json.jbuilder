json.array!(@stores) do |store|
  json.extract! store, :id, :user_id, :reg_no, :name, :tel, :address, :location, :pic, :description, :open_time, :close_time
  json.url store_url(store, format: :json)
end
