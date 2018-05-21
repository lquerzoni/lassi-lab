class AddRolesMaskToMoviegoers < ActiveRecord::Migration[5.2]
  def change
    add_column :moviegoers, :roles_mask, :integer
  end
end
