class CreateMoviegoers < ActiveRecord::Migration[5.1]
  def change
    create_table :moviegoers do |t|
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
