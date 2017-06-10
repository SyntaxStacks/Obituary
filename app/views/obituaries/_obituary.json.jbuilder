json.extract! obituary, :id, :name, :birth_date, :death_date, :content, :created_at, :updated_at
json.url obituary_url(obituary, format: :json)
