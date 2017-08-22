# == Schema Information
#
# Table name: artworks
#
#  id        :integer          not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :user, message: "User can only have one artwork of a certain name" }

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :aritst_id,
  class_name: :User
end
