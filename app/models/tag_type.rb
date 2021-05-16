class TagType < ApplicationRecord
  has_many  :tags

  TAG_TYPES = %w( genere instrument request ).freeze

  # validates_with  :valid_tag_type?

  def valid_tag_type?
    TAG_TYPES.include?(self.name)
  end
end
