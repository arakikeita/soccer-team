class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|

      t.timestamps
      t.references :user,  foreign_key: true
      t.references :team,  foreign_key: true
    end
  end
end
