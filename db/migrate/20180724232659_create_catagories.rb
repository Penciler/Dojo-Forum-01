class CreateCatagories < ActiveRecord::Migration[5.1]
  def change
    create_table :catagories do |t|
      t.text :name
      t.timestamps
    end
    add_column :posts, :catagory_id, :integer
  end
end
