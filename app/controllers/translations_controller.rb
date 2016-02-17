class TranslationsController < ApplicationController
  before_action :set_verse, only: [:create, :upvote]
  before_action :set_translation, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, only: [:create, :upvote]

  # GET /translations
  # GET /translations.json
  def index
  #  @translations = Translation.all
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  # GET /translations/new
  def new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = @verse.translations.new(translation_params)
    respond_to do |format|
      if @translation.save
        @translation.update(upvotes: 0, dnvotes: 0)
        format.html { redirect_to @verse, notice: 'Translation was successfully created.' }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1
  # PATCH/PUT /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to @translation, notice: 'Translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy
    respond_to do |format|
      format.html { redirect_to translations_url, notice: 'Translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @translation.upvote_by current_user
    @translation.column_record
    redirect_to verse_path(@verse)
  end

  private
    def set_verse
      #@verse = Verse.find(request.env["HTTP_REFERER"].split('/')[-1].to_i)
      @verse = Verse.find(params[:verse_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = @verse.translations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      params.require(:translation).permit(:translation, :reason, :upvotes, :dnvotes)
    end
end
