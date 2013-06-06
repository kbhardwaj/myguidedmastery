class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invite(email,notebook,sender)
  	@email = email
  	@notebook = notebook
  	@sender = sender
  	
  	mail(:to => "#{@email}", :subject => "My Guided Mastery: #{@sender.name} has invited you to check out this new notebook", :from => "#{@sender.email}")
  end

  def invite_guest(email,name,event)
  	@name = name
    @email = email
    @event =  event
    mail(:to => "#{@email}", :subject => "Invitation")
  end
  def cancel_event(email,event_name,event)
    @event = event  	  
      @email = email
  	@event_name =  event_name
    mail(:to => "#{@email}", :subject => "Invitation")
  end
end
