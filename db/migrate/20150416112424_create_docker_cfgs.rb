class CreateDockerCfgs < ActiveRecord::Migration
  def change
    create_table :docker_cfgs do |t|
      t.string :url
      t.string :auth
      t.string :email

      t.timestamps null: false
    end
  end
end
