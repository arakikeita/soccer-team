class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|

      t.timestamps
      t.string     :team_name     , null: false
      t.string     :name          , null: false
      t.text       :introduction          , null: false
      t.integer    :area_id       , null: false
      t.integer    :owner_id      , null: false
      t.references :user          ,foreign_key: true
     
    end
  end
end
