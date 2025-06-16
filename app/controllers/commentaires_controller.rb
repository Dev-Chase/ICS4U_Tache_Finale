class CommentairesController < ApplicationController
  before_action :set_commentaire, only: %i[ show edit update destroy ]

  # GET /commentaires or /commentaires.json
  def index
    @commentaires = Commentaire.all
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
    @commentaire = Commentaire.new(commentaire_params)

    respond_to do |format|
      if @commentaire.save
        format.html { redirect_to @commentaire, notice: "Commentaire was successfully created." }
        format.json { render :show, status: :created, location: @commentaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
    end
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
    @commentaire.destroy!

    respond_to do |format|
      format.html { redirect_to commentaires_path, status: :see_other, notice: "Commentaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentaire
      @commentaire = Commentaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commentaire_params
      params.require(:commentaire).permit(:utilisateur_id, :publication_id, :date_publiee, :contenue)
    end
end
