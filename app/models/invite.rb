class Invite < ActiveRecord::Base
  attr_accessible :email, :notebook_id
  belongs_to :notebook
  #after_save :email_invite

  private
  	def email_invite
  		UserMailer.send_invite(self).deliver
  	end
end
