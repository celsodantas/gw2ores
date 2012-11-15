class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :image
      t.string :image_mini

      t.timestamps
    end
  end
end
