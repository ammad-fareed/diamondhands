class TagType < ApplicationRecord
  has_many  :tags

  TAG_TYPES = %w( genere instrument request ).freeze

  scope :instrument_type, -> { find_by(name: :instrument, published: true) }
end
