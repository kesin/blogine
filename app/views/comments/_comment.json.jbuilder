json.extract! comment, :id, :content, :html_content, :creator_name, :creator_email, :creator_site, :post_id, :status, :created_at, :updated_at
json.url comment_url(comment, format: :json)