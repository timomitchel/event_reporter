require "csv"
require_relative "attendee"
require "pry"

class EventReporter

  attr_reader :filename, :data, :formatted_data

  def initialize(filename = './data/full_event_attendees.csv')
    @filename = filename
    @data = csv_load
  end

  def csv_load
    csv = CSV.open filename, headers: true, header_converters: :symbol
    csv.map {|row| Attendee.new(row, self)}
  end

  def format_zip_codes
    data.map do |attendee|
      attendee.zipcode.to_s.rjust(5, '0')[0..4]
    end
  end

  def format_phone_numbers
    data.map do |attendee|
      attendee.phone.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
    [$1, $2, $3].join("-")
    end
  end

  def find

  end
end
