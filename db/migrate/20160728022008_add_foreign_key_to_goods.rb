class AddForeignKeyToGoods < ActiveRecord::Migration
  def change
    add_foreign_key(:goods, :users, options: "ON UPDATE CASCADE ON DELETE CASCADE")
    add_foreign_key(:goods, :prototypes, options: "ON UPDATE CASCADE ON DELETE CASCADE")
  end
end
