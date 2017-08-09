class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string  :address
      t.string  :formatted_address
      t.float   :latitude           null: false
      t.float   :longitude          null: false

      t.timestamps
    end
  end
end
