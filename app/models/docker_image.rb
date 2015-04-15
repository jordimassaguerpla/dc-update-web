class DockerImage < ActiveRecord::Base
  # TODO: manage logging
  def run_update()
    puts "Running dc-update #{full_name}"
    output = `dc-update #{full_name}`
    puts output
  end
  def full_name
    "#{user_name}/#{repository_name}"
  end
end
