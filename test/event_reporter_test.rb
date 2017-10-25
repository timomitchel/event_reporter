require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/event_reporter.rb"

class EventReporterTest < Minitest::Test

  def test_initialize_holds_correct_objects
   reporter = EventReporter.new

    assert_instance_of EventReporter,reporter
    assert_instance_of Array,reporter.data
    assert_equal './data/full_event_attendees.csv',reporter.filename
  end

  def test_event_reporter_can_be_passed_another_file
   reporter = EventReporter.new("./data/event_attendees.csv")

    assert_instance_of EventReporter,reporter
    assert_instance_of Array,reporter.data
    assert_instance_of Attendee,reporter.data[5]
    assert_equal "./data/event_attendees.csv",reporter.filename
  end

  def test_can_load_default_csv_file_into_array_of_attendee_objects
   reporter = EventReporter.new

    assert_instance_of Array,reporter.csv_load
    assert_instance_of Attendee,reporter.csv_load[0]
  end

  def test_loads_all_csv_entries
   reporter = EventReporter.new

    assert_equal 5175,reporter.csv_load.length
  end

  def test_attendees_have_all_string_attributes
   reporter = EventReporter.new

    assert_instance_of String,reporter.csv_load[0].id
    assert_instance_of String,reporter.csv_load.first.date
    assert_instance_of String, reporter.csv_load[0].first_name
    assert_instance_of String,reporter.csv_load[0].last_name
    assert_instance_of String,reporter.csv_load[0].email
    assert_instance_of String,reporter.csv_load[0].phone
    assert_instance_of String,reporter.csv_load[0].street
    assert_instance_of String,reporter.csv_load.first.state
    assert_instance_of String,reporter.csv_load[0].zipcode
  end

  def test_attendees_have_correct_attributes
   reporter = EventReporter.new

    assert_equal '1',reporter.csv_load[0].id
    assert_equal '2008-11-12 10:47:00 -0700',reporter.csv_load.first.date
    assert_equal 'allison',reporter.csv_load[0].first_name
    assert_equal 'nguyen',reporter.csv_load[0].last_name
    assert_equal 'arannon@jumpstartlab.com',reporter.csv_load[0].email
    assert_equal '615-438-5000',reporter.csv_load[0].phone
    assert_equal '3155 19th st nw',reporter.csv_load[0].street
    assert_equal 'dc',reporter.csv_load.first.state
    assert_equal '20010',reporter.csv_load[0].zipcode
  end

  def test_data_formatted_correctly_when_file_passed_in
   reporter = EventReporter.new("./data/event_attendees.csv")

    assert_equal '11',reporter.data[10].id
    assert_equal 'aya',reporter.data[5].first_name
    assert_equal 'dc',reporter.data.first.state
    assert_equal '2008-11-23 20:44:00 -0700',reporter.data.last.date
  end
end
