class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '未完' },
    { id: 2, name: '達成' }
  ]

  include ActiveHash::Associations
  has_many :tasks
  
  end
 