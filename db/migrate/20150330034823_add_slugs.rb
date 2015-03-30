class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :lists, :slug, :string
  end
end
