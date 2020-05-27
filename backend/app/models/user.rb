class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]


  has_many :access_grants,
      class_name: "Doorkeeper::AccessGrant",
      foreign_key: :resource_owner_id,
      dependent: :destroy

  has_many :access_tokens,
      class_name: "Doorkeeper::AccessToken",
      foreign_key: :resource_owner_id,
      dependent: :destroy

  has_many :oauth_applications,
           class_name: "Doorkeeper::Application",
           as: :owner
end
