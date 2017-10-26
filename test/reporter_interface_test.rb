require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/reporter_interface"
require "./lib/event_reporter"
require_relative "test_helper"

class ReporterInterfaceTest < Minitest::Test

  attr_reader :interface

  def setup
    @interface = ReporterInterface.new
  end

  def test_attributes_return_correctly
    expected_format = "%-14s %-11s %-36s %-7s %-18s %5s %-36s %-13s"

    assert_equal [], interface.queue
    assert_equal expected_format, interface.print_format
  end

end
