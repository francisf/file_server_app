class CreateBlobs < ActiveRecord::Migration[5.1]
  def change
    create_table :blobs do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :blobs, :user_id
  end
end
