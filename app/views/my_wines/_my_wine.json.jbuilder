json.extract! my_wine, :id, :wine_id, :wine_cellar_id, :description, :created_at, :updated_at
json.url my_wine_url(my_wine, format: :json)
