class AddImageToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :image, :string
  end
end
