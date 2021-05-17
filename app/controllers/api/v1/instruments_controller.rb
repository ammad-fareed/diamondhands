class Api::V1::InstrumentsController < ApplicationController
  def index
    instrument_type = TagType.find_by(name: :instrument, published: true)
    @instruments = Tag.where(tag_type_id: instrument_type.id)

    render json: { data: @instruments }, status: :ok
  end
end
