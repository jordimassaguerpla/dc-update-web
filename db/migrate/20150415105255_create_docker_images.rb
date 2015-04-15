class CreateDockerImages < ActiveRecord::Migration
  def change
    create_table :docker_images do |t|
      t.string :user_name
      t.string :repository_name

      t.timestamps null: false
    end
  end
end
