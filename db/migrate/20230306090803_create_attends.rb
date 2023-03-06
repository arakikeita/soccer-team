class CreateAttends < ActiveRecord::Migration[6.0]
  def change
    create_table :attends do |t|

      t.timestamps
      t.integer    :area_id       , null: false
      t.references :user,  foreign_key: true
      t.references :calender,  foreign_key: true
    end
  end
end
