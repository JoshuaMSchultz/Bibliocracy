class Verse < ActiveRecord::Base
  belongs_to :chapter
  has_many :translations
end
