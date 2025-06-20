class SignalementsController < ApplicationController
  before_action :set_signalement, only: %i[ show edit update destroy ]

  # GET /signalements or /signalements.json
  def index
    if params[:utilisateur_id]
      @signalements = Signalement.joins(:publication)
                           .where(publications: { utilisateur_id: params[:utilisateur_id] })
      # @signalements = Signalement.all
    else
      @signalements = Signalement.all
    end

  end

  # GET /signalements/1 or /signalements/1.json
  def show
  end

  # GET /signalements/new
  def new
    @signalement = Signalement.new
    @publication = Publication.find(params[:publication_id])
  end

  # GET /signalements/1/edit
  def edit
    @publication = @signalement.publication
  end

  # POST /signalements or /signalements.json
  def create
    @signalement = Signalement.new(signalement_params)

    respond_to do |format|
      if @signalement.save
        format.html { redirect_to @signalement, notice: "Signalement was successfully created." }
        format.json { render :show, status: :created, location: @signalement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @signalement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signalements/1 or /signalements/1.json
  def update
    @publication = @signalement.publication
    respond_to do |format|
      if @signalement.update(signalement_params)
        format.html { redirect_to @signalement, notice: "Signalement was successfully updated." }
        format.json { render :show, status: :ok, location: @signalement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @signalement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signalements/1 or /signalements/1.json
  def destroy
    @signalement.destroy!

    respond_to do |format|
      format.html { redirect_to signalements_path, status: :see_other, notice: "Signalement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signalement
      @signalement = Signalement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signalement_params
      params.require(:signalement).permit(:utilisateur_id, :publication_id, :commentaire_id, :raison, :etat)
    end
end
