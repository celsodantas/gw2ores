class CreateOreResetHistories < ActiveRecord::Migration
  def change
    create_table :ore_reset_histories do |t|
      t.string :full_response
      t.boolean :new_version

      t.timestamps
    end
  end
end
