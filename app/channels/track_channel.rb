class TrackChannel < ApplicationCable::Channel
  def subscribed
    stream_from "track_channel" #{params[:track_id]}
  end

  def unsubscribed
    stop_all_streams
  end
end
