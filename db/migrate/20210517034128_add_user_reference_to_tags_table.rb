class AddUserReferenceToTagsTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :tags, :user, null: true
  end
end
