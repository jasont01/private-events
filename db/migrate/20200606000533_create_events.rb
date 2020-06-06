class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :event_name
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
