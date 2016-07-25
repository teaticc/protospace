class AddGoodCountToPrototype < ActiveRecord::Migration
  def change
    add_column :prototypes, :good_count, :integer
  end
end
