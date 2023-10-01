class HomesController < ApplicationController
  def index
    infos_system = InfoSystem.infos

    render json: { info: infos_system }
  rescue StandardError => e
    render json: { info: "Temos um problema! #{e}" }, status: :bad_request
  end
end
