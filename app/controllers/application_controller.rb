class ApplicationController < ActionController::API
  before_action :authenticate_request_platform

  def authenticate_request_platform
    auth = AuthorizationPlatform.new(request)
    @current_platform = auth.current_platform
    render json: { error: 'Not Authorized' }, status: 401 unless @current_platform
  end

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end

  def pagination_header(collection)
    gap_pages = Array.new(collection.total_pages).map.with_index(1) { |_x, i| i }.to_s

    response.set_header('current_page', collection.current_page)
    response.set_header('next_page', collection.next_page)
    response.set_header('prev_page', collection.prev_page)
    response.set_header('gap_pages', gap_pages)
    response.set_header('total_pages', collection.total_pages)
    response.set_header('total_count', collection.total_count)
  end

  rescue_from Exception,                           with: :render_error
  rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
  rescue_from ActionController::RoutingError,      with: :render_not_found
  rescue_from AbstractController::ActionNotFound,  with: :render_not_found
  rescue_from ActionController::ParameterMissing,  with: :render_parameter_missing
  rescue_from ArgumentError, with: :invalid_argument
  rescue_from StandardError do |exception|
    render json: { error: exception }, status: :bad_request
  end

  private

  def invalid_argument
    render json: { error: 'Invalid Argument' }, status: :bad_request
  end

  def render_error(exception)
    raise exception if Rails.env.test?

    # To properly handle RecordNotFound errors in views
    return render_not_found(exception) if exception.cause.is_a?(ActiveRecord::RecordNotFound)

    logger.error(exception) # Report to your error managment tool here

    return if performed?

    render json: { error: "Algo deu errado!" }, status: :internal_server_error
  end

  def render_not_found(exception)
    logger.info(exception) # for logging
    render json: { error: "Não encontrada!" }, status: :not_found
  end

  def render_record_invalid(exception)
    logger.info(exception) # for logging
    render json: { errors: exception.record.errors.as_json }, status: :bad_request
  end

  def render_parameter_missing(exception)
    logger.info(exception) # for logging
    render json: { error: "Invalid Argument" }, status: :unprocessable_entity
  end
end
