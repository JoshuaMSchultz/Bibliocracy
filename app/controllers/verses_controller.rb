class VersesController < ApplicationController
  before_action :set_verse, only: [:show]
  before_action :set_top_verse, only: [:show]

  def show
  end


  private

  def set_verse
    @verse = Verse.find(params[:id])
  end

  def set_top_verse
    #change to upvote
    @topverse = @verse.translations.order(id: :desc).first
  end

end
