class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :province, :city, :district, :current_temp
end
