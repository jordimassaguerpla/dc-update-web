class ChangeDateToDateTimeInRuns < ActiveRecord::Migration
  def change
    change_column :runs, :start, :datetime
    change_column :runs, :stop, :datetime
  end
end
