class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :rating
      t.string :description

      t.timestamps
    end
  end
end