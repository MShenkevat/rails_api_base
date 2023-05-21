class Api::V1::TargetsController < ApplicationController
  # con este skip me salteo el token, después se vuelve a activar?
  skip_before_action :verify_authenticity_token

  def index
    # head :ok
    @targets = Target.all 
    render json: @targets
  end

  def show
  end

  def create
    @target = Target.new(target_params)

    if @target.save
      render json: @target, status: :created
    else
      render json: @target.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    @target = Target.find(params[:id])
    @target.destroy

    head :no_content
  end

  private 

  def target_params
    params.require(:target).permit([
      :title,
      :latitude,
      :longitude,
      :radius,
      :topic_id
    ])
  end
end
