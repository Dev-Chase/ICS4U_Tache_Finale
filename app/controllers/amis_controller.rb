class AmisController < ApplicationController
  before_action :authenticate_utilisateur!
  before_action :set_ami, only: %i[ show edit update destroy ]

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
    @ami = Ami.new(ami_params)

    respond_to do |format|
      if @ami.save
        format.html { redirect_to @ami, notice: "Ami was successfully created." }
        format.json { render :show, status: :created, location: @ami }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ami.errors, status: :unprocessable_entity }
      end
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
    @ami.destroy!

    respond_to do |format|
      format.html { redirect_to amis_path, status: :see_other, notice: "Ami was successfully destroyed." }
      format.json { head :no_content }
    end
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
