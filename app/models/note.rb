class Note < ActiveRecord::Base
  attr_accessible :author, :content, :title, :notebook_id, :user_id, :created_at, :tag_list
  belongs_to :notebook
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_reputation :votes, source: :user, aggregated_by: :sum
  acts_as_taggable
end
