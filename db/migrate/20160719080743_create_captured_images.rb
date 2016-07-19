class CreateCapturedImages < ActiveRecord::Migration
  def change
    create_table :captured_images do |t|
      t.string  :img_url
      t.integer :img_type
      t.timestamps null: false
    end
  end
end
