# frozen_string_literal: true

class AuthorizationPlatform
  def initialize(request)
    @token = request.headers[:Application]
  end

  def current_platform
    @platform ||= Platform.find_by(secret: JsonWebToken.decode(@token)[:plataform_secret]) if @token.present?
  rescue StandardError => e
    e
  end
end
