class AuthenticateUser

  def initialize(email, password)
    @email = email
    @password = password
  end

def call
    JsonWebToken.encode(admin_id: admin.id) if admin
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end