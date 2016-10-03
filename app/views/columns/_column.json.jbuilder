json.extract! column, :id, :name, :ident, :posts_count, :created_at, :updated_at
json.url column_url(column, format: :json)