class Profile < ActiveRecord::Base
  belongs_to :user

  #nicknameがnilの場合、usernameの値を格納
  def nickname_to_username
    if nickname.blank?
      "@" + user.username
    else
      nickname
    end
  end

  def username?
    if nickname.present?
      "@" + user.username
    else

    end
  end

end