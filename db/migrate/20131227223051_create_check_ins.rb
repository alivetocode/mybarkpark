class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.integer :dog_id, null:false
      t.integer :park_id, null:false
      t.datetime :check_out_at

      t.timestamps
    end
  end
end
