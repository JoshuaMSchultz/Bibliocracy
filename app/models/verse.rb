class Verse < ActiveRecord::Base
  belongs_to :chapter
  has_many :translations
  accepts_nested_attributes_for :translations

  def topverse
    translations.order(upvotes: 'desc').first
  end


end
