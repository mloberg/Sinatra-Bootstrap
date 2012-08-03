module Bootstrap
  class User
    include DataMapper::Resource

    property :id,       Serial
    property :email,    String,     :required => true, :unique => true, :format => :email_address
    property :password, BCryptHash, :required => true
    property :token,    String

    before :create do
      self.token = SecureRandom.hex
    end

    def login(password)
      @password == password
    end
  end
end
