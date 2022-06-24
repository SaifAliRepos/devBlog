json.extract! reply, :id, :replyable_id, :replyable_type, :content, :created_at, :updated_at
json.url reply_url(reply, format: :json)
