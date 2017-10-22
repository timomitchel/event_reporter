require 'time'
require "pry"
class Attendee

  attr_reader :id, :date, :first_name, :last_name,
              :email, :phone, :street, :city, :state,
              :zipcode
  def initialize(info, parent)
    @id = info[:'']
    @date = Time.strptime(info[:regdate], '%D %R')
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @email = info[:email_address]
    @phone = info[:homephone]
    @street = info[:street]
    @city = info[:city]
    @state = info[:state]
    @zipcode = info[:zipcode]
    @parent = parent
  end
end
