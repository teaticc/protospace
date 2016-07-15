class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :copy
      t.string :concept
      t.string :title
      t.integer :user_id
      t.timestamps
    end
  end
end
