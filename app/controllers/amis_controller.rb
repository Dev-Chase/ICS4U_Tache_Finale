class AmisController < ApplicationController
  before_action :authenticate_utilisateur!
  before_action :set_ami, only: %i[ show edit update ]

  # GET /amis or /amis.json
  def index
    @amis = Ami.all
  end

  # GET /amis/1 or /amis/1.json
  def show
  end

  # GET /amis/new
  def new
    @ami = Ami.new
  end

  # GET /amis/1/edit
  def edit
  end

  # POST /amis or /amis.json
  def create
    @utilisateur = Utilisateur.find(params[:utilisateur_id])
    if @utilisateur.id == current_utilisateur.id
      flash[:alert] = "Tu ne peux pas etre amis avec toi meme"
      redirect_to utilisateurs_path and return
    end

    if Ami.find_by(utilisateur_1_id: @utilisateur.id, utilisateur_2_id: current_utilisateur.id) || Ami.find_by(utilisateur_1_id: current_utilisateur.id, utilisateur_2_id: @utilisateur.id)
      flash[:alert] = "Vous etes deja amis avec #{@utilisateur.surnom}"
      redirect_to utilisateurs_path and return
    end
    @ami = Ami.new(ami_params)
    @ami.utilisateur_1_id = current_utilisateur.id
    @ami.utilisateur_2_id = @utilisateur.id
    @ami.status = "amis"
    # TODO: modify update so that frendship status can be changed

    if @ami.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("add_utilisateur_#{@utilisateur.id}") }
        format.html {redirect_to utilisateurs_path, notice: "#{@utilisateur.surnom} était ajouté en tant qu'ami" }

        format.turbo_stream
        format.html { redirect_to publication_path(@publication) }

        format.html { redirect_to @ami, notice: "Ami was successfully created." }
        format.json { render :show, status: :created, location: @ami }
      end
    else
      flash[:alert] = "Error in creating the relationship"
      redirect_to utilisateurs_path and return
    end
  end

  # PATCH/PUT /amis/1 or /amis/1.json
  def update
    respond_to do |format|
      if @ami.update(ami_params)
        format.html { redirect_to @ami, notice: "Ami was successfully updated." }
        format.json { render :show, status: :ok, location: @ami }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ami.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amis/1 or /amis/1.json
  def destroy
    # NOTE: weirdly, we are treating params[:utilisateur_id] = other_user/the current user's friend and params[:id] = current_utilisateur.id, (so params[:id] is pretty much useless)
    @utilisateur = Utilisateur.find(params[:utilisateur_id])
    @ami = Ami.find_by(utilisateur_1_id: current_utilisateur.id, utilisateur_2_id: params[:utilisateur_id])
    unless @ami
      @ami = Ami.find_by!(utilisateur_1_id: params[:utilisateur_id].id, utilisateur_2_id: current_utilisateur)
    end

    @ami.destroy!
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@utilisateur) }
      format.html {redirect_to amis_path, notice: "Ami enlever" }
    end

    # @ami.destroy!
    #
    # respond_to do |format|
    #   format.html { redirect_to amis_path, status: :see_other, notice: "Ami was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ami
      @ami = Ami.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ami_params
      params.require(:ami).permit(:utilisateur_1_id, :utilisateur_2_id, :status)
    end
end
