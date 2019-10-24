class User < ApplicationRecord
  authenticates_with_sorcery!

  VALID_PASSWORD_REGEX = /\A[a-zA-Z\d]+\z/.freeze
  validates :password,
            length: { maximum: 16, too_long:  'パスワードは%{count}文字以内で入力してください。',
                      minimum: 4,  too_short: 'パスワードは%{count}文字以上で入力してください。' },
            format: { with: VALID_PASSWORD_REGEX, message: 'パスワードの形式が間違っています。半角英数字で入力してください。' },
            presence: true, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation,
            length: { maximum: 16, too_long:  'パスワードは%{count}文字以内で入力してください。',
                      minimum: 4,  too_short: 'パスワードは%{count}文字以上で入力してください。' },
            format: { with: VALID_PASSWORD_REGEX, message: 'パスワードの形式が間違っています。半角英数字で入力してください。' },
            presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :user_code,
            uniqueness: true,
            length: { maximum: 16, too_long:  'ユーザーIDは%{count}文字以内で入力してください。',
                      minimum: 4,  too_short: 'ユーザーIDは%{count}文字以上で入力してください。' }
  validates :user_name, presence: true
  validates :email, uniqueness: true, presence: true

  validate :sample

  def sample
    if password != password_confirmation
      errors.add(:password, "一致しません")
    end
  end

  def set_password(password, password_confirmation)
    self.password = password
    self.password_confirmation = password_confirmation
  end
end
