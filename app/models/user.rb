class User < ApplicationRecord
    attr_accessor :activation_token
    before_save :downcase_email
    before_create :create_activation_digest
    has_secure_password
    has_many :orders
    has_many :cartitems

    def decode_activation_digest(params_token, user_token)
        begin
          @decoded_token = JWT.decode(user_token, 'yourSecret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
        return @decoded_token[0] == params_token
    end

    private

        def downcase_email
            self.email = email.downcase
        end
        
        def create_activation_digest
            self.activation_token = User.new_token
            self.activation_digest = User.digest(activation_token)
        end

        def User.digest(token)
            JWT.encode(token, 'yourSecret')
        end
        
        def User.new_token
            SecureRandom.urlsafe_base64
        end
end
