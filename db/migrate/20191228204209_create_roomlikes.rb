class CreateRoomlikes < ActiveRecord::Migration[5.2]
  def change
    create_table :roomlikes do |t|

      t.timestamps
    end
  end
end
