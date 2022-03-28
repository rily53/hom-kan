class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  has_many   :home_users
  has_many   :homes, through: :home_users
  has_many   :tasks
  has_many   :lists
  has_many   :memos
  has_many   :calendars
  has_many   :calendar_memos
  has_many   :informations
  has_many   :storehouses

end
