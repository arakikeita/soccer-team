class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :content, null: false
      t.references :user,  foreign_key: true
      t.references :team,  foreign_key: true
      t.references :game,  foreign_key: true


    end
  end
end
