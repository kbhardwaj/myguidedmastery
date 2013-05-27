class Note < ActiveRecord::Base
  attr_accessible :author, :content, :title, :notebook_id, :user_id, :created_at
  belongs_to :notebook
  belongs_to :user
  has_many :comments, dependent: :destroy
end
