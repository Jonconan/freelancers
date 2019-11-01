class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :profile_image_path, ProfileImagePathUploader

  VALID_PASSWORD_REGEX = /\A[a-zA-Z\d]+\z/.freeze
  validates :name, presence: true
  validates :user_code, presence: true,
            uniqueness: true,
            length: { maximum: 16, minimum: 4 },
            format: { with: VALID_PASSWORD_REGEX, message: 'の形式が間違っています。半角英数字で入力してください。' }
  validates :user_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password,
            presence: true, confirmation: true,
            length: { maximum: 16, minimum: 4 },
            format: { with: VALID_PASSWORD_REGEX, message: 'の形式が間違っています。半角英数字で入力してください。' },
            if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation,
            presence: true,
            length: { maximum: 16, minimum: 4 },
            format: { with: VALID_PASSWORD_REGEX, message: 'の形式が間違っています。半角英数字で入力してください。' },
            if: -> { new_record? || changes[:crypted_password] }

  validate :match_password_confirm

  def match_password_confirm
    if password != password_confirmation
      errors.add(:password, "一致しません")
    end
  end

  def set_password(password, password_confirmation)
    self.password = password
    self.password_confirmation = password_confirmation
  end

  def valid_of_specified?(*columns)
    errors = []
    columns.each do |column|
      if self.errors.messages.include?(column)
        errors.push(self.errors.messages[column])
      end
    end
    errors.blank?
  end
end
