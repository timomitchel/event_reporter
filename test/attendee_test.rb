require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/event_reporter.rb"
require "./lib/attendee"

class AttendeeTest < Minitest::Test

  def test_attributes_return_correctly
    reporter = EventReporter.new
    attendee = Attendee.new(reporter.data)

    assert_equal "", attendee.id
  end

end
