class CitiesController < ApplicationController
  include Paginable
  def index
    @cities = City.page(current_page).per(per_page)
    options = get_links_serializer_options('cities_path', @cities)
    render json: CitySerializer.new(@cities, options).serializable_hash
  end

  def update_temp
    @city = City.find(params[:id])

    response = RestClient.get "http://v.juhe.cn/weather/index", 
                              :params => { cityname: @city.juhe_id, :key => "18cb49dd7a253e37c059777cbfe2089b" }
    data = JSON.parse(response.body)

    @city.update( current_temp: data["result"]["sk"]["temp"] )

    render json: CitySerializer.new(@cities).serializable_hash, status: :ok
end
end
