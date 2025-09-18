require 'net/http'
require 'uri'
require 'json'
require 'date'

uri = URI.parse('https://worldweather.wmo.int/en/json/47_en.json')
response = Net::HTTP.get_response(uri)

doc = JSON.parse(response.body)

city_name = doc['city']['cityName']
current_forecast = doc['city']['forecast']['forecastDay'][0]
min_temp = current_forecast['minTemp']
max_temp = current_forecast['maxTemp']

average_month_temp = doc['city']['climate']['climateMonth']

date = DateTime.now.strftime('%m')
month = date.to_i - 1
min_month_temp = average_month_temp[month]['minTemp']
max_month_temp = average_month_temp[month]['maxTemp']

puts "Город: #{city_name}"
puts "Температура завтра от #{min_temp} °C до #{max_temp} °C"
puts "Среднемесячная температура от #{min_month_temp} °C до #{max_month_temp} °C"