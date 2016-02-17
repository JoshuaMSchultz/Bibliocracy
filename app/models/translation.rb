class Translation < ActiveRecord::Base
  belongs_to :verse

  acts_as_votable

  #after_validation :column_record

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  def column_record
    self.update(upvotes: score)
  end

end
