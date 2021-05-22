class CreateTrackTags < ActiveRecord::Migration[6.0]
  def change
    create_table :track_tags do |t|
      t.references  :track
      t.references  :tag
      t.timestamps
    end
  end
end
