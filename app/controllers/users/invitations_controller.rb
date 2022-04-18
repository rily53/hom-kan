class Users::InvitationsController < Devise::InvitationsController
  def new
    super
    # @user = User.find_by(email: params[:email])
  end

  def create
    # if User.exists?(email: invite_params[:email])
    #   # @user.save
    #   redirect_to room_homes_path
    # else
      super
    # end
    # @user = User.find_by(email: params[:email])
    # if @user.save
      # redirect_to room_homes_path
    # else
      # render :new
    # end
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end


  # private
# 
  # def registered
    # if @user == @invite
      # @user = User.invite!(:email => email) do |u|
      # u.skip_invitation = true
      # end
    # end
  # end

  # protected

  # def invite_resource(&block)
  #   @user = User.find_by(email: invite_params[:email])
  #   # @user is an instance or nil
  #   if @user && @user.email != current_user.email
  #     # invite! instance method returns a Mail::Message instance
  #     @user.invite!(current_user)
  #     # return the user instance to match expected return type
  #     @user
  #   else
  #     # invite! class method returns invitable var, which is a User instance
  #     resource_class.invite!(invite_params, current_inviter, &block)
  #   end
  # end
end
