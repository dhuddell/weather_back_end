class WeatherPairsController < OpenReadController


  # GET /weather_pairs
  def index
    @weather_pairs = current_user.profile.weather_pairs

    render json: @weather_pairs
  end

  # GET /weather_pairs/1
  def show
    @weather_pair = current_user.profile.weather_pairs.find(params[:id])


    render json: @weather_pair
  end

  # POST /weather_pairs
  def create
    @weather_pair = current_user.profile.weather_pairs.build(weather_pair_params)

    if @weather_pair.save
      render json: @weather_pair, status: :created, location: @weather_pair
    else
      render json: @weather_pair.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weather_pairs/1
  def destroy
    @weather_pair.destroy

    head :no_content
  end

  def weather_pair_params
    params.require(:weather_pair).permit(:weather, :genre, :profile_id)
  end


end
