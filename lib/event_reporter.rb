require "csv"
require_relative "attendee"

class EventReporter

  attr_reader :filename, :data

  def initialize(filename = './data/full_event_attendees.csv')
    @filename = filename
    @data = load.map {|row| Attendee.new(row, self)}
  end

  def load
    CSV.open filename, headers: true, header_converters: :symbol
  end

  def input
    gets.chomp
  end


end
