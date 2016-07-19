class CreateCapturedImages < ActiveRecord::Migration
  def change
    create_table :captured_images do |t|
      t.string :img_url
      t.integer :prototype_id
      t.integer :image_type, limit: 1
      t.timestamps
    end
  end
end
