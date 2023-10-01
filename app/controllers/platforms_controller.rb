class PlatformsController < ApplicationController
  skip_before_action :authenticate_request_platform
  before_action :set_platform, only: %i[destroy]

  # GET /platforms
  def index
    @platforms = Platform.order(:name).page(@page).per(@per_page)

    render json: @platforms, meta: pagination_dict(@platforms)
  end

  # POST /platforms
  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      render json: @platform, status: :created, location: @platform
    else
      render json: @platform.errors, status: :unprocessable_entity
    end
  end

  # DELETE /platforms/1
  def destroy
    @platform.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_platform
    @platform = Platform.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def platform_params
    params.require(:platform).permit(:name)
  end
end
