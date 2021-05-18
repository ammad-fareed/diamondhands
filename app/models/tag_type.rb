class TagType < ApplicationRecord
  has_many  :tags

  TAG_TYPES = %w( genere instrument request ).freeze

  scope :instrument_type -> self.find_by(name: :instrument, published: true)
end
