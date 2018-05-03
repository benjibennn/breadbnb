class UsersController < Clearance::UsersController
  def create
    @user = user_from_params
    p @user.valid?
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
    	p @user.errors
      render template: "users/new"
    end
  end

  	def edit

	  	@user = User.find(current_user.id)


	end

	def update
		@user = User.find(current_user.id)
		@user.update(user_params)
		redirect_to '/'
	end

	private	 
 	def user_params
      params.require(:user).permit(:email, :fname , :gender, :phone, :country, :avatar, :password)
    end	

	def user_from_params
	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    fname = user_params.delete(:fname)
	    gender = user_params.delete(:gender)
	    phone  = user_params.delete(:phone)
	    country  = user_params.delete(:country)
	    role = user_params.delete(:role)
	    avatar = user_params.delete(:avatar)

	    Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.fname = fname
	      user.gender = gender
	      user.phone = phone
	      user.country = country
	      user.role = role
	      user.avatar = avatar
    	end
  	end
end
