class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name, null:false
      t.string :breed
      t.string :gender
      t.string :color
      t.string :photo_url
      t.integer :owner_id, null:false
      t.string :personality_attributes

      t.timestamps
    end
  end
end
