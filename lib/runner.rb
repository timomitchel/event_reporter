require_relative "event_reporter"
require "pry"
require_relative 'output'

class Runner

  include Output

  attr_reader :reporter, :queue

  def initialize
    @queue = []
    intro
    evaluate_first_command(input_splitter)
  end

  def input_splitter
    STDIN.gets.chomp.split(" ")
  end

  def evaluate_first_command(input)
    return if input[0] == 'quit'
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

  def try_again_next_command
    restart_message_with_help
    evaluate_next_command(input_splitter)
  end

  def evaluate_next_command(input)
    return if input[0] == 'quit'
    if input[0] == 'queue'
      queue_executer(input)
    elsif input[0] == 'find'
      find_executer(input)
      evaluate_next_command(input_splitter)
    else
      try_again_next_command
    end
  end

  def find_executer(input)
    all = @reporter.data.find_all do |attendee|
      attendee.send(input[1].to_sym) == input[2]
    end
    @queue << all
    @queue.flatten
  end
end

Runner.new
