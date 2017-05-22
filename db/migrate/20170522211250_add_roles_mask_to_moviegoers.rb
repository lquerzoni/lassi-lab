class AddRolesMaskToMoviegoers < ActiveRecord::Migration
  def change
    add_column :moviegoers, :roles_mask, :integer
  end
end
