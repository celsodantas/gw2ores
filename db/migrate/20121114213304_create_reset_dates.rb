class CreateResetDates < ActiveRecord::Migration
  def change
    create_table :reset_dates do |t|
      t.timestamps
    end
  end
end
