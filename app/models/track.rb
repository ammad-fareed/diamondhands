class Track < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true
  validates :user, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rebounds, class_name: 'Track', foreign_key: 'rebound_track_id'
  belongs_to :rebound_from, class_name: 'Track', foreign_key: 'rebound_track_id', optional: true

  scope :baked, -> { joins(:likes).where("likes.baked = true") }

  def bakes
    likes.where(baked: true)
  end

  def og_track
    last_track = rebound_from
    last_track.present? ? last_track.og_track : self
  end

  def all_rebounds
    all = []
    all << self
    if rebounds.length > 0
      rebounds.map do |rebound|
        all << rebound.all_rebounds
      end
    end

    all.flatten.uniq
  end

  def all_rebounds_attributes(current_user)
    all_rebounds.map do |rebound|
      rebound.show_attributes(current_user)
    end
  end

  def show_attributes(current_user)
    attributes.merge({
      artist_name: user.artist_name, 
      num_likes: likes.length,
      num_bakes: bakes.length,
      num_comments: comments.length,
      num_rebounds: all_rebounds.length - 1,
      baked: baked_for_user?(current_user),
      liked: liked_for_user?(current_user),
      og_track: og_track.try(:attributes),
      rebound_from: rebound_from.try(:attributes)
    })
  end

  def liked?
    likes.find_by(baked: true).present?
  end

  def liked_for_user?(current_user)
    return liked? unless user.present?
    @user_likes ||= user.likes
    @user_likes.find_by(track_id: id).present?
  end

  def baked?
    likes.find_by(baked: true).present?
  end

  def baked_for_user?(user)
    return baked? unless user.present?
    @user_likes ||= user.likes
    @user_likes.find_by(baked: true, track_id: id).present?
  end

  def check_the_oven
    score = [100 - hours_old, 1].max
    bakes.length * score
  end

  def hours_old
    ((Time.now - created_at) / 3600).round
  end
end
