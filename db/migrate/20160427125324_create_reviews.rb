class CreateReviews < ActiveRecord::Migration[5.1]

  def change
    create_table :reviews do |t|
      t.integer    'potatoes'
      t.text       'comments'
      t.integer	   'likes'
      t.references 'moviegoer'
      t.references 'movie'
    end
  end

  def down
  	drop_table 'reviews'
  end
end
