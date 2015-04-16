json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :docker_cfg_id
  json.url user_url(user, format: :json)
end
