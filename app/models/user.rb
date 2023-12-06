class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*(\+[a-z0-9-]+)?@[a-z0-9-]+(\.[a-z0-9-]+)*\Z/, message: "Must be a valid email address" }
    validates :name, presence: true, format: { with: /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/, message: "Must be a valid first and last name" }
end
