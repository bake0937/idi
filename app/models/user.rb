class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable,:authentication_keys => [:login]

  #association
  #profileとの1:1ヒモ付
  has_one :profile
  has_many :articles
  has_many :reviews

  before_create :build_default_profile

  #validation
  validates :username,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 4, maximum: 31 },format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "ユーザー名は半角英数字です"}

  #論理削除
  acts_as_paranoid
  # 削除済のユーザーと同じemailを登録するとユニーク制約でエラーになるため
  # オーバライドをすることでユニーク制約だけを削除する
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
  # サーバーが高負荷時などに、ユーザーが2度押したことで同じ値がDBに登録されてしまうのを防止
  validates :email, uniqueness_without_deleted: true

  # usernamteまたはメールアドレスでログインできるように認証条件を書き換え
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  #uniqueness_without_deleted: true を追加したためユニークチェックが余分にかかってしまうため阻止
  def email_changed?
    false
  end

  #Sign_up時に、userテーブルと紐付けたprofilesテーブルのデータを生成する
  private
  def build_default_profile
       build_profile
       true
  end

end
