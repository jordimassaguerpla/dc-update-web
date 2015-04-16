json.array!(@docker_cfgs) do |docker_cfg|
  json.extract! docker_cfg, :id, :url, :auth, :email
  json.url docker_cfg_url(docker_cfg, format: :json)
end
