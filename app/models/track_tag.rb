class TrackTag < ApplicationRecord
  belongs_to  :tag
  belongs_to  :track
end
