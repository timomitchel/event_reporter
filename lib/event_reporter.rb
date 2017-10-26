require "csv"
require_relative "attendee"

class EventReporter

  attr_reader :filename, :data

  def initialize(filename = './data/full_event_attendees.csv')
    @filename = filename
    @data = csv_load
  end

  def csv_load
    csv_open.map {|row| Attendee.new(row)}
  end

  def csv_open
    CSV.open filename, headers: true, header_converters: :symbol
  end

  def hash_maker
      csv_load.reduce(Hash.new(0)) do |hash, attendee|
        hash[attendee.first_name] = 'first_name'
        hash
    end
  end

  def attendee_hash_scratch
    data.map { |attendee| [attendee.city, attendee] }.to_h
  end
end
