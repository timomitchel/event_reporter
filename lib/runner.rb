require_relative "event_reporter"
require "pry"

class Runner
  attr_reader :reporter, :queue

  def initialize
    @queue = []
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
    load_path(input)
  end

  def load_path(input)
    if input[0] == 'load' && File.exist?("./data/#{input[1]}") && input[1] != nil
      load_file_input(input)
    elsif input[0] == 'load' && input[1].nil?
      load_default_file
    else
      try_again_first_command
    end
  end

  def load_file_input(input)
    @reporter = EventReporter.new("./data/#{input[1]}")
    evaluate_next_command(input_splitter)
  end

  def load_default_file
    @reporter = EventReporter.new
    evaluate_next_command(input_splitter)
  end

  def try_again_first_command
    restart_message
    evaluate_first_command(input_splitter)
  end

  def evaluate_next_command(input)
    return if input[0] == 'q'
    if input[0] == 'queue'
      queue_executer(input)
    elsif input[0] == 'find'
      find_executer(input)
    else
      evaluate_next_command(input_splitter)
    end
  end

  def find_executer(input)
    all = @reporter.data.find_all do |attendee|
      binding.pry
      attendee.(input[1]) == input[2]
    end
    @queue << all
  end
end

Runner.new
