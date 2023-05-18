class Api::V1::TopicsController < ApplicationController
  # con este skip me salteo el token, después se vuelve a activar?
  skip_before_action :verify_authenticity_token
  
  def index
    # head :ok
    topics = Topic.all
    render json: topics, status: 200
  end

  def show
  end

  def create
    topic = Topic.new(
      label: topic_params[:label],
      icon: topic_params[:icon]
    )
    if topic.save
      render json: topic, status: 200
    else
      render json: {
        error: "Error Creating topic"
      }
    end
  end

  def update
  end

  def destroy
  end

  # this method controls the parameters we can pass by api to create a new topic
  private
  def topic_params
    params.require(:topic).permit([
      :label,
      :icon
    ])
  end
end
