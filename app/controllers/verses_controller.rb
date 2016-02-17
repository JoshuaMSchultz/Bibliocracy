class VersesController < ApplicationController
  before_action :set_verse, only: [:show]
  before_action :set_top_translation, only: [:show]

  def show
    @translations = @verse.translations.order(upvotes: :desc)
  end


  private

  def set_verse
    @verse = Verse.find(params[:id])
  end

  def set_top_translation
    @topverse = @verse.translations.order(upvotes: :desc)[0]
  end


end
