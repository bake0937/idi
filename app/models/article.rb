class Article < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  enum category: {
    web: 1,
    mobile: 2,
    desk_top: 3
  }
end