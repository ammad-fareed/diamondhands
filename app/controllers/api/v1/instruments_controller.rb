class Api::V1::InstrumentsController < ApplicationController
  def index
    instrument_type = TagType.find_by(name: :instrument, published: true)
    @instruments = Tag.where(tag_type_id: instrument_type.id).map { |instrument| instrument.slice(:id, :name, :tag_type_id, :created_at, :updated_at) }

    render json: { data: @instruments }, status: :ok
  end

  def create
  end
end
