class Tag < ApplicationRecord  
  belongs_to  :tag_type
  has_many  :instruments
  has_many  :track_tags

  scope :get_all_instruments, ->(instrument_type_id) { self.where(tag_type_id: instrument_type_id).map { |instrument| instrument.slice(:id, :name, :tag_type_id, :created_at, :updated_at) } }
end
