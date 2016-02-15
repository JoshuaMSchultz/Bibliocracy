class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show]

  def show
    @verses = @chapter.verses
  end


  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

end
