class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name, null:false
      t.string :address, null:false, unique:true
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :photo_url
      t.text :description, limit:500

      t.timestamps
    end
  end
end
