json.array!(@docker_images) do |docker_image|
  json.extract! docker_image, :id, :user_name, :repository_name
  json.url docker_image_url(docker_image, format: :json)
end
