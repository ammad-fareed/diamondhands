class Api::V1::InstrumentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    instrument_type = TagType.instrument_type
    @instruments = Tag.get_all_instruments(instrument_type.id)

    render json: { data: @instruments }, status: :ok
  end

  def create
    if instrument_params.present?
      @instrument = Instrument.new(user_id: instrument_params[:user_id], tag_id: instrument_params[:id])
      if @instrument.save!
        render json: { message: "Successfully Created", body: @instrument }, status: :created
      else
        render json: { message: "Can not update the Instrument list" }, status: :bad_request
      end
    end
  end

  def selected_instruments
    if params[:user_id].present?
      @instruments = Instrument.includes(:tag).where(user_id: params[:user_id]).map { |instrument| instrument.tag.slice(:name, :id, :tag_type_id) }

      render json: @instruments, status: :ok
    end
  end

  private

  def instrument_params
    params.require(:data).permit(:name, :id, :tag_type_id, :user_id)
  end
end
