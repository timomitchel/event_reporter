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
    exit if input[0] == 'quit'
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
    file_loaded
    evaluate_next_command(input_splitter)
  end

  def load_default_file
    @reporter = EventReporter.new
    file_loaded
    evaluate_next_command(input_splitter)
  end

  def try_again_first_command
    restart_message
    evaluate_first_command(input_splitter)
  end

  def try_again_next_command
    restart_message_with_help
  end

  def evaluate_next_command(input)
    exit if input[0] == 'quit'
    if input[0] == 'queue'
      queue_executer(input)
    elsif input[0] == 'find'
      find_executer(input)
    elsif input[0] == "help"
      help_executer(input)
    else
      try_again_next_command
    end
    evaluate_next_command(input_splitter)
  end

  def queue_executer(input)
    exit if input[0] == 'quit'
    if input[1] == "count"
      puts "#{@queue.flatten.count}"
    elsif input[1] == "clear"
      @queue.clear
    elsif input[1] == "print" && input[2].nil?
      print_headers
    elsif input[1] == "print" && input[2] == "by" && input[3] != nil
      print_attribute(input[3])
    elsif input[1] == "save" &&  input[2] == "to" && input[3] != nil
      save(input[3])
    elsif input[1] == "export" && input[2] == "html" && input[3] != nil
      export(input[3])
    else
      try_again_next_command
    end
  end

  def find_executer(input)
    all = @reporter.data.find_all do |attendee|
      attendee.send(input[1].to_sym) == input[2].downcase
    end
    @queue << all
  end
end

Runner.new
