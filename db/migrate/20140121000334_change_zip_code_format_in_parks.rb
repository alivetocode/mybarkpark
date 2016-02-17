class ChangeZipCodeFormatInParks < ActiveRecord::Migration

  def up
   change_column :parks, :zip_code, :string
  end

  def down
   change_column :parks, :zip_code, :integer
  end


end
