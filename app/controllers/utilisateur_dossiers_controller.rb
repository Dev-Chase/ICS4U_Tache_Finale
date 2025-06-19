class UtilisateurDossiersController < ApplicationController
  before_action :authenticate_utilisateur!
  before_action :set_utilisateur_dossier, only: %i[ show edit update destroy ]

  # GET /utilisateur_dossiers or /utilisateur_dossiers.json
  def index
    @utilisateur_dossiers = UtilisateurDossier.where(utilisateur_id: current_utilisateur.id)
  end

  # GET /utilisateur_dossiers/1 or /utilisateur_dossiers/1.json
  def show
  end

  # GET /utilisateur_dossiers/new
  def new
    @utilisateur_dossier = UtilisateurDossier.new
  end

  # GET /utilisateur_dossiers/1/edit
  def edit
  end

  # POST /utilisateur_dossiers or /utilisateur_dossiers.json
  def create
    @utilisateur_dossier = UtilisateurDossier.new(utilisateur_dossier_params)

    respond_to do |format|
      if @utilisateur_dossier.save
        format.html { redirect_to @utilisateur_dossier, notice: "Utilisateur dossier was successfully created." }
        format.json { render :show, status: :created, location: @utilisateur_dossier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @utilisateur_dossier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utilisateur_dossiers/1 or /utilisateur_dossiers/1.json
  def update
    respond_to do |format|
      if @utilisateur_dossier.update(utilisateur_dossier_params)
        format.html { redirect_to @utilisateur_dossier, notice: "Utilisateur dossier was successfully updated." }
        format.json { render :show, status: :ok, location: @utilisateur_dossier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @utilisateur_dossier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utilisateur_dossiers/1 or /utilisateur_dossiers/1.json
  def destroy
    @utilisateur_dossier.destroy!

    respond_to do |format|
      format.html { redirect_to utilisateur_dossiers_path, status: :see_other, notice: "Utilisateur dossier était supprimer proprement" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utilisateur_dossier
      @utilisateur_dossier = UtilisateurDossier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def utilisateur_dossier_params
      params.require(:utilisateur_dossier).permit(:utilisateur_id, :nom)
    end
end
