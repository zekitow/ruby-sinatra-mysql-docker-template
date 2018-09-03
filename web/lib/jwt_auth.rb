class JwtAuth
  JWT_SECRET = "secret"
  JWT_ISSUER = "example.com"
  
  #
  # Generates username token
  #
  def self.token(username)
    JWT.encode(payload(username), JWT_SECRET, 'HS256')
  end

  #
  # Generates payload for user
  #
  def self.payload(username)
    {
      exp: Time.now.to_i + 60 * 60,
      iat: Time.now.to_i,
      iss: JWT_ISSUER,
      user: { username: username }
    }
  end

end