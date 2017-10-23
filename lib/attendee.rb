require 'time'
require "pry"

class Attendee

  attr_reader :id, :date, :first_name, :last_name,
              :email, :phone, :street, :city, :state, :zipcode

  def initialize(info)
    @id = info[:'']
    @date = Time.strptime(info[:regdate], '%D %R')
    @first_name = clean_capitalization(info[:first_name])
    @last_name = clean_capitalization(info[:last_name])
    @email = clean_capitalization(info[:email_address])
    @phone = clean_phone_numbers(info[:homephone])
    @street = clean_capitalization(info[:street])
    @city = clean_capitalization(info[:city])
    @state = clean_capitalization(info[:state])
    @zipcode = clean_zipcode(info[:zipcode])
  end

  def clean_zipcode(zipcode_entry)
    zipcode_entry.to_s.rjust(5, '0')[0..4]
  end

  def clean_capitalization(entry)
    entry.downcase if entry != nil
  end

  def clean_phone_numbers(number)
    number.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
  [$1, $2, $3].join("-")
  end
end
