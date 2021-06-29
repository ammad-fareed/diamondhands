module Types
  class TrackType < Types::BaseObject
    field :id, ID, null: false
    # field :user_id, Integer, null: false
    field :link, String, null: false
    # field :audio_type, String,  null: false
    field :photo, String, null: false
  end
end
