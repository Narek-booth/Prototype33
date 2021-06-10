class CommitmentsController < ApplicationController
  before_action :set_commitment, only: %i[ show edit update destroy ]
  before_action :ensure_current_user_is_owner, only: [:destroy, :update, :edit]

  # GET /commitments or /commitments.json
  def index
    @commitments = Commitment.all
  end

  # GET /commitments/1 or /commitments/1.json
  def show
  end

  # GET /commitments/new
  def new
    @commitment = Commitment.new
  end

  # GET /commitments/1/edit
  def edit
  end

  # POST /commitments or /commitments.json
  def create
    @commitment = Commitment.new(commitment_params)
    @commitment.owner = current_user
    @commitment.status = "active"
  
    respond_to do |format|
      if @commitment.save
        format.html { redirect_back fallback_location: root_path, notice: "Commitment was successfully created." }
        format.json { render :show, status: :created, location: @commitment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commitments/1 or /commitments/1.json
  def update
    respond_to do |format|
      if @commitment.update(commitment_params)
        format.html { redirect_back fallback_location: root_path, notice: "Commitment was successfully updated." }
        format.json { render :show, status: :ok, location: @commitment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commitments/1 or /commitments/1.json
  def destroy
    @commitment.destroy
    respond_to do |format|
      format.html { redirect_to commitments_url, notice: "Commitment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commitment
      @commitment = Commitment.find(params[:id])
    end

    def ensure_current_user_is_owner
      if current_user != @comment.author
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end

    # Only allow a list of trusted parameters through.
    def commitment_params
      params.require(:commitment).permit(:target, :description, :donation_size, :status, :cause_id, :owner)
    end
end
