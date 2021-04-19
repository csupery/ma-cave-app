json.extract! wine, :id, :wine_type, :appellation_id, :created_at, :updated_at
json.url wine_url(wine, format: :json)
