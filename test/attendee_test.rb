require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/event_reporter.rb"
require "./lib/attendee"

class AttendeeTest < Minitest::Test

  attr_reader :attendee, :reporter

  def setup
    @reporter = EventReporter.new
    @attendee = Attendee.new({'': 1,
                              regdate: '11/12/08 10:47',
                              first_name: "Allison",
                              last_name: "Nguyen",
                              email_address: "arannon@jumpstartlab.com",
                              homephone: '6154385000',
                              street: "3155 19th St NW",
                              city: "Washington",
                              state: "dc",
                              zipcode: "20010"})
  end

  def test_attributes_return_correctly
    assert_equal 1, attendee.id
    assert_equal '2008-11-12 10:47:00 -0700', attendee.date
    assert_equal 'allison', attendee.first_name
    assert_equal 'nguyen', attendee.last_name
    assert_equal 'arannon@jumpstartlab.com', attendee.email
    assert_equal '615-438-5000', attendee.phone
    assert_equal '3155 19th st nw', attendee.street
    assert_equal 'washington', attendee.city
    assert_equal 'dc', attendee.state
    assert_equal '20010', attendee.zipcode
  end

  def test_clean_zipcode
    assert_equal '02030', attendee.clean_zipcode('2030')
    assert_equal '00000', attendee.clean_zipcode(nil)
    assert_equal '00001', attendee.clean_zipcode(1)
    assert_instance_of String, attendee.clean_zipcode([20003])
  end

  def test_clean_capitalization
    assert_nil nil, attendee.clean_capitalization(nil)
    assert_equal "", attendee.clean_capitalization('')
    assert_equal '234', attendee.clean_capitalization(234)
    assert_equal "molly", attendee.clean_capitalization("MoLLy")
    assert_equal 'salt lake city', attendee.clean_capitalization("Salt Lake City")
  end

end
