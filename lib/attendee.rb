require 'time'
require "pry"
class Attendee

  def initialize(info, parent)
    @id = info[:'']
    @date = Time.strptime(info[:regdate], '%D %R')
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @email = info[:email_address]
    @phone = info[:home_phone]
    @street = info[:street]
    @city = info[:city]
    @state = info[:state]
    @zipcode = info[:zipcode]
    @parent = parent
  end
end
