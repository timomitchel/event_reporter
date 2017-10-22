require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/event_reporter.rb"

class EventReporterTest < Minitest::Test

  def test_initialize_holds_correct_objects
    er = EventReporter.new

    assert_instance_of EventReporter, er
    assert_equal './data/full_event_attendees.csv', er.filename
  end

  def test_can_load_default_csv_file
    er = EventReporter.new

    assert_instance_of CSV, er.load
  end


end
