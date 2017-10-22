require "csv"
require_relative "attendee"
require "pry"

class EventReporter

  attr_reader :filename, :data

  def initialize(filename = './data/full_event_attendees.csv')
    @filename = filename
    @data = csv_load
    binding.pry
  end

  def csv_load
    csv = CSV.open filename, headers: true, header_converters: :symbol
    csv.map {|row| Attendee.new(row)}
  end
end

EventReporter.new
