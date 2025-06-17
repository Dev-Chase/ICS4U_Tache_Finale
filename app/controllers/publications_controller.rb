class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[ show edit update destroy ]

  # GET /publications or /publications.json
  def index
    @publications = Publication.with_attached_media.order(created_at: :desc).page(params[:page]).per(10)
    # @publications = liked_posts_if_signed_in(Publication.with_attached_media.order(created_at: :desc).page(params[:page]).per(10))
  end

  # GET /publications/1 or /publications/1.json
  def show
    @commentaires = @publication.commentaires
    @commentaire = Commentaire.new
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy!

    respond_to do |format|
      format.html { redirect_to publications_path, status: :see_other, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
      # if utilisateur_signed_in?
      #   @publication.liked = (Like.find_by(utilisateur_id: @publication.utilisateur_id, publication_id: @publication.id)) ? true : false
      # end
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:utilisateur_id, :caption, :media)
    end
end
