require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/event_reporter.rb"

class EventReporterTest < Minitest::Test

  def test_initialize_holds_correct_objects
    er = EventReporter.new

    assert_instance_of EventReporter, er
    assert_instance_of Array, er.data
    assert_equal './data/full_event_attendees.csv', er.filename
  end

  def test_can_load_default_csv_file
    er = EventReporter.new

    assert_instance_of CSV, er.csv_load
  end

  def test_format_zip_code_returns_correct_attendee_zip_codes
    er = EventReporter.new

    assert_equal '02703', er.format_zip_codes[10]
    assert_equal '2703', er.data[10].zipcode
  end

  def test_format_returns_formatted_attendee_phone_numbers
    er = EventReporter.new

    assert_equal 12, er.format_phone_numbers[500].length
    assert_equal 12, er.format_phone_numbers[4000].length
    assert_equal 12, er.format_phone_numbers[3456].length
    assert_equal 12, er.format_phone_numbers[2498].length
    assert_equal '941-979-2000', er.format_phone_numbers[2]
    assert_equal '704-813-3000', er.format_phone_numbers[3]
    assert_equal '414-520-5000', er.format_phone_numbers[1]
  end
end
