class AddUserIdToDockerImage < ActiveRecord::Migration
  def change
    add_column :docker_images, :user_id, :integer
  end
end
