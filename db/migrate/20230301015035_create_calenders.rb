class CreateCalenders < ActiveRecord::Migration[6.0]
  def change
    create_table :calenders do |t|

      t.timestamps
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time, null: false
      t.references :user,  foreign_key: true
      t.references :team,  foreign_key: true
      
    end
  end
end
