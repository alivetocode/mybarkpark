class ChangeDogPersonalities < ActiveRecord::Migration
  def up
    change_column :dogs, :personality_attributes, :text
  end

  def down
    change_column :dogs, :personality_attributes, :string
  end
end
