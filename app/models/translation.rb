class Translation < ActiveRecord::Base
  belongs_to :verse

  acts_as_votable

  
end
