class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, 
    { id: 2, name: 'FW' }, 
    { id: 3, name: 'MF' },
    { id: 4, name: 'DF' }, 
    { id: 5, name: 'GK' }
  ]

  include ActiveHash::Associations
  has_many :user
  

end