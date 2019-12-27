class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user
      t.string :image
      t.string :text
      t.timestamps
    end
  end
end
