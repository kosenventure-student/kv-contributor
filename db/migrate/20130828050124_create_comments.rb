class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user_id, index: true
      t.references :post_id, index: true
      t.text :content

      t.timestamps
    end
  end
end
