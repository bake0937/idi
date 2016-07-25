class Article < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :delete_all

  validates :title, presence: true
  validates :category, presence: true
  validates :detail, presence: true

  enum category: {
    web: 1,
    mobile: 2,
    desk_top: 3
  }

  def self.inherited(klass)
    klass.class_eval do
      def self.categories_i18n
        categories_i18n
      end

      def category_i18n
        category_i18n[category]
      end
    end

    super
  end
end