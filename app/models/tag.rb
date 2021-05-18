class Tag < ApplicationRecord  
  belongs_to  :tag_type
  has_many  :instruments
  has_many  :track_tags
end
