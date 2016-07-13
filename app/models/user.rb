class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :authentication_keys => [:login]
         #,:validatable

  #validation
  validates :username,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 4, maximum: 31 },format: { with: /\A[a-zA-Z0-9_]+\z/, message: "ユーザー名は半角英数字です"}


  #論理削除
  acts_as_paranoid
  #退会したユーザが、退会した時と同じメールアドレスで登録できるようにするため、オーバライドしてユニーク制約だけを削除する
  def self.included(base)
    base.extend ClassMethods
    assert_validations_api!(base)

    base.class_eval do
      validates_presence_of   :email, if: :email_required?
      # validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
      validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

      validates_presence_of     :password, if: :password_required?
      validates_confirmation_of :password, if: :password_required?
      validates_length_of       :password, within: password_length, allow_blank: true
    end
  end
  validates :email, uniqueness_without_deleted: true

  #サインイン認証条件を書き換え
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end
end
