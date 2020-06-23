require 'uri'
require 'net/http'
require 'openssl'
module PlayerHelper
  def api_nationalitys
    url = URI("https://restcountries-v1.p.rapidapi.com/all")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'restcountries-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '446cffa650msh72e3dc3b06425b6p12caa1jsn8e9be0c71243'
    response = http.request(request)
    api = response.read_body
    nationality = JSON.parse(api)
    @name_nationality = nationality.map{ |x| x["name"] }
  end
end
