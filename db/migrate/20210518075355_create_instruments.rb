class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.references  :user, null: false
      t.references  :tag, null: false
      t.timestamps
    end
  end
end
