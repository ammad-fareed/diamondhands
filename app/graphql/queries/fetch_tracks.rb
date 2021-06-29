module Queries
  class FetchTracks < Queries::BaseQuery

    type [Types::TrackType], null: false

    def resolve
      Track.all.order(created_at: :desc)
    end
  end
end
