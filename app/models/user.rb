class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: {in: 4..16}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :user_code, uniqueness: true

  validates :user_code, length: {in: 4..16}
end
