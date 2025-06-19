class EnregistresController < ApplicationController
  before_action :authenticate_utilisateur!
  before_action :set_enregistre, only: %i[ show edit update destroy ]

  # GET /enregistres or /enregistres.json
  def index
    @utilisateur_dossier = UtilisateurDossier.find(params[:utilisateur_dossier_id])
    @publications = Publication.joins(:enregistres).where(enregistres: {utilisateur_dossier_id: @utilisateur_dossier.id})
  end

  # GET /enregistres/1 or /enregistres/1.json
  def show
  end

  # GET /enregistres/new
  def new
    @enregistre = Enregistre.new
  end

  # GET /enregistres/1/edit
  def edit
  end

  # POST /enregistres or /enregistres.json
  def create
    if Enregistre.find_by(enregistre_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append("publication_enregistre_#{enregistre_params[:publication_id]}", partial: 'enregistres/already_exists') }
        format.html { redirect_to @publication, notice: "Commentaire éxistait déjà." }
      end

      return
    end
    @enregistre = Enregistre.new(enregistre_params)

    if @enregistre.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append("publication_enregistre_#{@enregistre.publication_id}", partial: 'enregistres/successfully_added') }
        format.html { redirect_to @publication, notice: "Commentaire etait publie proprement." }
      end
    else
      render :new
    end
  end

  # PATCH/PUT /enregistres/1 or /enregistres/1.json
  def update
    respond_to do |format|
      if @enregistre.update(enregistre_params)
        format.html { redirect_to @enregistre, notice: "Enregistre was successfully updated." }
        format.json { render :show, status: :ok, location: @enregistre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enregistre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enregistres/1 or /enregistres/1.json
  def destroy
    @publication = Publication.find(params[:publication_id])
    @utilisateur_dossier = @enregistre.utilisateur_dossier

    @enregistre.destroy!
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("publication_section_#{@publication.id}") }
      format.html {redirect_to utilisateur_dossier_enregistres_path(@utilisateur_dossier), notice: "Publication Enregistré Supprimé de #{@utilisateur_dossier.nom}" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enregistre
      @enregistre = Enregistre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enregistre_params
      params.require(:enregistre).permit(:utilisateur_dossier_id, :publication_id)
    end
end
