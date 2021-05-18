class Api::V1::InstrumentsController < Api::ApiController
  def index
    instrument_type = TagType.find_by(name: :instrument, published: true)
    @instruments = Tag.where(tag_type_id: instrument_type.id).map { |instrument| instrument.slice(:id, :name, :tag_type_id, :created_at, :updated_at) }

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
  end

  private

  def instrument_params
    params.require(:data).permit(:name, :id, :tag_type_id, :user_id)
  end
end
