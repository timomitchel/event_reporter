require_relative "event_reporter"
require "pry"

class Runner

  def initialize
    intro
    evaluate_first_command(input_splitter)
  end

  def intro
    puts "Hello please type 'load' and the file you would like to load"
  end

  def input_splitter
    gets.chomp.split(" ")
  end

  def evaluate_first_command(input)
    return if input[0] == 'q'
    if input[0] == 'load' && File.exist?("./data/#{input[1]}")
      @reporter = EventReporter.new("./data/#{input[1]}")
    elsif input[0] == 'load' && input[1].nil?
      @reporter = EventReporter.new
    else
      puts "That is not an executable command.
      Please enter a valid csv file after
      load or we will load the full_event_attendees.csv
      if you type load then enter"
    end
  end
end

Runner.new
