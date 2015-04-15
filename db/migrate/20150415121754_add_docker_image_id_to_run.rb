class AddDockerImageIdToRun < ActiveRecord::Migration
  def change
    add_column :runs, :docker_image_id, :integer
  end
end
