class CreateRoomimages < ActiveRecord::Migration[5.2]
  def change
    create_table :roomimages do |t|
      t.references :user, foreign_key: true
      t.string :image
      t.string :text
      t.timestamps
    end
  end
end
