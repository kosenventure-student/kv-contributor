class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.references :user_id, index: true
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
