class User < ApplicationRecord
    attr_accessor :activation_token
    before_save :downcase_email
    before_create :create_activation_digest
    has_secure_password
    has_many :orders
    has_many :cartitems

    private

        def downcase_email
            self.email = email.downcase
        end
        
        def create_activation_digest
            self.activation_token = User.new_token
        end

        def User.new_token
            SecureRandom.urlsafe_base64
        end
end
