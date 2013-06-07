class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
        #user ||= User.new # guest user (not logged in)
        unless user
            can :read, :all
            cannot :read, Notebook, :access => "invite-only"
        else
            can :read, :all
            can :create, Comment
            can :destroy, Comment, :user_id => user.id
            can :create, Note, :notebook => {:user_id => user.id} # If the user owns the notebook, he or she can create notes in it.
            can :update, Note, :user_id => user.id # If the user owns the note, he or she can update the note
            can :destroy, Note, :user_id => user.id
            can :create, Note, :notebook => {:access => "open"} #If the notebook is 'open', any signed in user can add a note to it.
            can :vote, Note
            can :update, Notebook, :user_id => user.id
            can :create, Notebook, :access => "invite-only"
            cannot :read, Notebook, :access => "invite-only"
            can :read, Notebook, :user_id => user.id
            can :read, Notebook, :invites => {:email => user.email}
            
            can :destroy, Notebook, :user_id => user.id
            # can :create, :notes do |note|
            #     note.notebook.access == 'open'
            # end
            if user.admin?
                can :manage, :all
            end
        end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
