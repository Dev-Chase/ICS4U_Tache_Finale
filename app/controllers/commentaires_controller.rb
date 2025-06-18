class CommentairesController < ApplicationController
  before_action :authenticate_utilisateur!, only: %i[ index destroy ]
  before_action :set_commentaire, only: %i[ show edit update destroy ]

  # GET /commentaires or /commentaires.json
  def index
    @publications = Publication.joins(:commentaires).having(commentaires: { utilisateur_id: current_utilisateur.id }).group(:publication_id).with_attached_media.order(created_at: :desc)
    @commentaires = Commentaire.where(utilisateur_id: current_utilisateur.id)
  end

  # GET /commentaires/1 or /commentaires/1.json
  def show
  end

  # GET /commentaires/new
  def new
    @commentaire = Commentaire.new
  end

  # GET /commentaires/1/edit
  def edit
  end

  # POST /commentaires or /commentaires.json
  def create
    @publication = Publication.find(params[:publication_id])
    @commentaire = @publication.commentaires.new(commentaire_params)

    if @commentaire.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append('commentaires', partial: 'commentaires/commentaire', locals: { commentaire_instance: @commentaire, publication: @publication }) }
        format.html { redirect_to @publication, notice: "Commentaire etait publie proprement." }
      end
    else
      render :new
    end
    # respond_to do |format|
    #   if @commentaire.save
    #     format.html { redirect_to @commentaire, notice: "Commentaire was successfully created." }
    #     format.json { render :show, status: :created, location: @commentaire }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @commentaire.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /commentaires/1 or /commentaires/1.json
  def update
    respond_to do |format|
      if @commentaire.update(commentaire_params)
        format.html { redirect_to @commentaire, notice: "Commentaire was successfully updated." }
        format.json { render :show, status: :ok, location: @commentaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentaires/1 or /commentaires/1.json
  def destroy
    @publication = @commentaire.publication
    if @commentaire.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@commentaire) }
        format.html { redirect_to publication_path(@publication), notice: "Like deleted." }
      end
    else
      redirect_to @publication, alert: "Error deleting like."
    end

    # @commentaire.destroy!
    # respond_to do |format|
    #   format.turbo_stream
    #   format.html { redirect_to publication_path(@publication) }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentaire
      @commentaire = Commentaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commentaire_params
      params.require(:commentaire).permit(:utilisateur_id, :publication_id, :contenue)
    end
end
