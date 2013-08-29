class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.references :user, index: true
      t.text :content

      t.timestamps
    end
  end
end
