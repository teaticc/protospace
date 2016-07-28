class RemoveGoodCountFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :good_count, :integer
    add_column :prototypes, :goods_count, :integer
  end
end
