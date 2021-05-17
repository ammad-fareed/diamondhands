class Tag < ApplicationRecord
  belongs_to  :tag_type
  belongs_to  :track, optional: true
  belongs_to  :user, optional: true
end
