class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.date :start
      t.date :stop
      t.boolean :success
      t.string :log_file

      t.timestamps null: false
    end
  end
end
