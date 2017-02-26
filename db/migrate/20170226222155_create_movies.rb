class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :rating
      t.text :genre
      t.text :image_url
      t.integer :minutes

      t.timestamps
    end
  end
end
