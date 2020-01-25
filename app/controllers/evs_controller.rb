class EvsController < ApplicationController
  before_action :set_ev, only: [:show, :update, :delete]

  # GET /evs
  def index
    @evs = Ev.scan

    render json: @evs
  end

  # GET /evs/1
  def show
    render json: @ev
  end

  # POST /evs
  def create
    @ev = Ev.new

    if @ev.replace(ev_params)
      render json: @ev, status: :created
    else
      render json: @ev.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evs/1
  def update
    if @ev.update(ev_params)
      render json: @ev
    else
      render json: @ev.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evs/1
  def delete
    @ev.destroy
    render json: {deleted: true}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ev
      @ev = Ev.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ev_params
      params.require(:ev).permit(:title, :place, :url, :opened_at, :closed_at)
    end
end
