class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.boolean :mark
      t.integer :user_id, :markable_id
      t.string :markable_type
      t.timestamps
    end
  end
end
