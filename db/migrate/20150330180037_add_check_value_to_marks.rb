class AddCheckValueToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :marked, :boolean
  end
end
