class AddArtistToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :artist_name, :string
    add_column :items, :artist_url, :string
  end
end
