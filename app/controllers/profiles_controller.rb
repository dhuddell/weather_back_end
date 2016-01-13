class ProfilesController < OpenReadController
  # GET /profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  # GET /profiles/1
  def show
    # @profile = Profile.where user: params[:user_id]
    @profile = current_user.profile

    render json: @profile
  end

  # POST /profiles
  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      GoogleMapsApi.new(@profile)
      @profile.save # this is bad, no brain to fix JRH

      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH /profiles/1
  def update
    @profile = current_user.profile

    if @profile.update(update_params)
      GoogleMapsApi.new(@profile)
      @profile.save # this is bad, no brain to fix JRH

      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile = current_user.profile

    @profile.destroy

    head :no_content
  end

private

  def profile_params
    params.require(:profile).permit(:nickname, :zip_code, :fav_meme, :user_id)
  end

  def update_params
    params.require(:profile).permit(:nickname, :zip_code)
  end
end
