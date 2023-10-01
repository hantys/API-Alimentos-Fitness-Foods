class Platform < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  before_validation :generate_key

  def generate_key
    generate_secret
    self.key = JsonWebToken.encode({ plataform_secret: secret }, 100.year.from_now)
  end

  private

  def generate_secret
    self.secret = (Digest::SHA1.hexdigest(SecureRandom.uuid)[0..20]).downcase
    generate_token if Platform.exists?(secret:)
  end
end
