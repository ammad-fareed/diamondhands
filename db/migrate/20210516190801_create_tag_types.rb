class CreateTagTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_types do |t|
      t.string  :name
      t.boolean :published, default: true
      t.timestamps
    end
  end
end
