class AddPrototypeIdToCapturedImage < ActiveRecord::Migration
  def change
    add_column :captured_images, :prototype_id, :integer
  end
end
