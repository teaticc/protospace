class RemoveCapturedImageFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :captured_image
  end
end
