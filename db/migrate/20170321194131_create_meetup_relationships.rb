class CreateMeetupRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :meetup_relationships do |t|
      t.integer :user_id
      t.integer :meetup_id
      t.timestamps
    end
  end
end
