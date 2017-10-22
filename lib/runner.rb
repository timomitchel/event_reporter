require_relative "event_reporter"
require "pry"

class Runner
  attr_reader :reporter, :queue

  def initialize
    @queue = []
    @reporter = []
    intro
    evaluate_first_command(input_splitter)
  end

  def intro
    puts "Hello please type 'load' and the file you would like to load"
  end

  def input_splitter
    STDIN.gets.chomp.split(" ")
  end

  def restart_message
    puts "That is not an executable command.
    Please enter a valid csv file after
    load or we will load the full_event_attendees.csv
    if you type load and then hit enter."
  end

  def evaluate_first_command(input)
    return if input[0] == 'q'
    if input[0] == 'load' && File.exist?("./data/#{input[1]}") && input[1] != nil
      @reporter << EventReporter.new("./data/#{input[1]}")
      evaluate_next_command(input_splitter)
    elsif input[0] == 'load' && input[1].nil?
      @reporter << EventReporter.new
      evaluate_next_command(input_splitter)
    else
      restart_message
      evaluate_first_command(input_splitter)
    end
  end

  def evaluate_next_command(input)
    if input[0] == 'queue'
      queue(input)
    elsif input[0] == 'find'
      find(input)
    else
      evaluate_next_command(input_splitter)
    end
  end

  def find(input)
    all = @reporter.data.find_all do |attendee|
      binding.pry
      attendee.input[1] == input[2]
    end
    @queue << all
  end
end

Runner.new
