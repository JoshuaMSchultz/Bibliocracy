class VersesController < ApplicationController
  before_action :set_verse, only: [:show]
  before_action :set_top_translation, only: [:show]

  def show
  end


  private

  def set_verse
    @verse = Verse.find(params[:id])
  end

  def set_top_translation
    #change to upvote
    @topverse = @verse.translations.order(upvotes: :desc)[0]
    @translations = @verse.translations.order(upvotes: :desc)
  end


end
