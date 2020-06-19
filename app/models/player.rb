require 'uri'
require 'net/http'
require 'openssl'

class Player < ApplicationRecord
  CONSTANT = @array
  def self.api
    url = URI("https://restcountries-v1.p.rapidapi.com/all")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'restcountries-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '446cffa650msh72e3dc3b06425b6p12caa1jsn8e9be0c71243'
    response = http.request(request)
    api = response.read_body
    b = JSON.parse(api)
    @array = []
    for i in 0..b.size do
      @array << b[i]["name"]
    end
  end
  mount_uploader :image, ImageUploader
  mount_uploader :diagram, DiagramUploader
  validates :name, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :shirt_number, presence: true
  validates :image, presence: true
  validates :diagram, presence: true
  validates :strengths, presence: true
  validates :weaknesses, presence: true
  validates :age, presence: true
  enum preferred_foot: { Right: 0, Left: 1, Both: 2 }
end
