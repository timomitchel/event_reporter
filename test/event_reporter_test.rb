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

  def test_event_reporter_can_be_passed_another_file
    er = EventReporter.new("./data/event_attendees.csv")

    assert_instance_of EventReporter, er
    assert_instance_of Array, er.data
    assert_instance_of Attendee, er.data[5]
    assert_equal "./data/event_attendees.csv", er.filename
  end

  def test_can_load_default_csv_file_into_array_of_attendee_objects
    er = EventReporter.new

    assert_instance_of Array, er.csv_load
    assert_instance_of Attendee, er.csv_load[0]
  end

  def test_loads_all_csv_entries
    er = EventReporter.new

    assert_equal 5175, er.csv_load.length
  end

  def test_attendees_have_all_string_attributes
    er = EventReporter.new

    assert_instance_of String, er.csv_load[0].id
    assert_instance_of String, er.csv_load.first.date
    assert_instance_of String,  er.csv_load[0].first_name
    assert_instance_of String, er.csv_load[0].last_name
    assert_instance_of String, er.csv_load[0].email
    assert_instance_of String, er.csv_load[0].phone
    assert_instance_of String, er.csv_load[0].street
    assert_instance_of String, er.csv_load.first.state
    assert_instance_of String, er.csv_load[0].zipcode
  end

  def test_attendees_have_correct_attributes
    er = EventReporter.new

    assert_equal '1', er.csv_load[0].id
    assert_equal '2008-11-12 10:47:00 -0700', er.csv_load.first.date
    assert_equal 'allison', er.csv_load[0].first_name
    assert_equal 'nguyen', er.csv_load[0].last_name
    assert_equal 'arannon@jumpstartlab.com', er.csv_load[0].email
    assert_equal '615-438-5000', er.csv_load[0].phone
    assert_equal '3155 19th st nw', er.csv_load[0].street
    assert_equal 'dc', er.csv_load.first.state
    assert_equal '20010', er.csv_load[0].zipcode
  end

  def test_case_name

  end

end
