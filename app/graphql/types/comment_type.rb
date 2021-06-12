module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :track_id, Integer, null: false
    field :text, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
