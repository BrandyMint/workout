class User < ActiveRecord::Base
  has_many :logs

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes['password'] }

  authenticates_with_sorcery!
end
