class AddPhotoUrlToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :photo_url, :string
  end
end
