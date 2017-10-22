require 'time'
require "pry"
class Attendee

  attr_reader :id, :date, :first_name, :last_name,
              :email, :phone, :street, :city, :state, :zipcode
  def initialize(info)
    @id = info[:'']
    @date = Time.strptime(info[:regdate], '%D %R')
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @email = info[:email_address]
    @phone = clean_phone_numbers(info[:homephone])
    @street = info[:street]
    @city = info[:city]
    @state = info[:state]
    @zipcode = clean_zipcode(info[:zipcode])
  end

  def clean_zipcode(zipcode_entry)
    zipcode_entry.to_s.rjust(5, '0')[0..4]
  end

  def clean_phone_numbers(number)
    number.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
  [$1, $2, $3].join("-")
  end
end
