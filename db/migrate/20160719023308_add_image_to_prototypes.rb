class AddImageToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :captured_image, :string
  end
end
