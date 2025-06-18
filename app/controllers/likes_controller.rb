class LikesController < ApplicationController
  before_action :authenticate_utilisateur!
  before_action :set_like, only: %i[ show edit update ]

  # GET /likes or /likes.json
  def index
    @publications = Publication.with_attached_media.order(created_at: :desc).page(params[:page]).per(10)
    liked_ids = current_utilisateur.likes.where(publication_id: @publications.map(&:id)).pluck(:publication_id)
    @publications = @publications.select { |p| liked_ids.include?(p.id) }
  end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  def create
    @publication = Publication.find(params[:publication_id])
    unless Like.exists?(publication_id: @publication.id, utilisateur_id: current_utilisateur.id)
      @like = @publication.likes.create(utilisateur: current_utilisateur)
    end
    # @like = Like.new(like_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to publication_path(@publication) }
      # if @like.save
      #   format.html { redirect_to @like, notice: "Like was successfully created." }
      #   format.json { render :show, status: :created, location: @like }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @like.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: "Like was successfully updated." }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @publication = @like.publication
    @like.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to publication_path(@publication) }
      # format.html { redirect_to likes_path, status: :see_other, notice: "Like was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:utilisateur_id, :publication_id)
    end
end
