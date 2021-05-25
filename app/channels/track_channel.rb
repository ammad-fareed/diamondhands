class TrackChannel < ApplicationCable::Channel
  def subscribed
    stream_from "track_channel" #{params[:track_id]}
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
