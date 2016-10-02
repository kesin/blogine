json.extract! post, :id, :title, :ident, :content, :html_content, :column_id, :status, :created_at, :updated_at
json.url post_url(post, format: :json)