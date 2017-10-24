require "csv"
require_relative "attendee"
require "pry"

class EventReporter

  attr_reader :filename, :data

  def initialize(filename = './data/full_event_attendees.csv')
    @filename = filename
    @data = csv_load
  end

  def csv_load
    csv = CSV.open filename, headers: true, header_converters: :symbol
    csv.map {|row| Attendee.new(row)}
  end

  def hash_maker
      data.reduce(Hash.new) do |hash, attendee|
        hash[attendee.id] = attendee
        hash
    end
  end
end
