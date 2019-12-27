class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.references :user
      t.string :title
      t.string :text
      t.string :image
      t.timestamps
    end
  end
end
