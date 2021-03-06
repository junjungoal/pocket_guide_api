class Tourist < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Garage::Representer
  include Garage::Authorizable

  has_many :plans

  property :id
  property :name
  property :email
  collection :plans

  def self.build_permissions(perms, other, target)
    perms.permits! :read
    perms.permits! :write
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write if self == other
  end
end
