class EnregistresController < ApplicationController
  before_action :authenticate_utilisateur!
  before_action :set_enregistre, only: %i[ show edit update destroy ]

  # GET /enregistres or /enregistres.json
  def index
    @enregistres = Enregistre.all
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
    @enregistre = Enregistre.new(enregistre_params)

    respond_to do |format|
      if @enregistre.save
        format.html { redirect_to @enregistre, notice: "Enregistre was successfully created." }
        format.json { render :show, status: :created, location: @enregistre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enregistre.errors, status: :unprocessable_entity }
      end
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
    @enregistre.destroy!

    respond_to do |format|
      format.html { redirect_to enregistres_path, status: :see_other, notice: "Enregistre was successfully destroyed." }
      format.json { head :no_content }
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
