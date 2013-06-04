class Notebook < ActiveRecord::Base
  attr_accessible :title, :access, :user_id
  has_many :notes, dependent: :destroy
  has_many :invites
  belongs_to :user

end
