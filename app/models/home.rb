class Home < ApplicationRecord

  validates :home_name, presence: true, uniquness: true, length: { minimum: 5, maximum: 20, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }

  has_many   :home_users
  has_many   :users, through: :home_users
  has_many   :tasks
  has_many   :lists
  has_many   :memos
  has_many   :calendar_memos
  has_many   :informations
  has_many   :storehouses

end