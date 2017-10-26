require_relative "event_reporter"
require "pry"
require_relative 'text_output'
require_relative 'queue_output'
require_relative 'find_execution'
require_relative 'variable_formatting'
require 'erb'
require_relative 'help_executer'

class ReporterInterface

  include HelpExecuter
  include QueueOutput
  include TextOutput
  include FindExecution
  include VariableFormatting

  attr_reader :queue, :print_format

  def initialize
    @queue = []
    @print_format = '%-14s %-11s %-36s %-7s %-18s %5s %-36s %-13s'
  end

  def start
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

  def evaluate_next_command(input)
    exit if input[0] == 'quit'
    if input[0] == 'queue'
      queue_executer(input)
    elsif input[0] == 'find' && check_for_attendee_instance_variable(input)
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
      print_queue_clear
      @queue.clear
    elsif input[1] == "print" && input[2].nil?
      print_queue
    elsif input[1] == "print" && input[2] == "by" && input[3] != nil
      sort_by_attribute(input[3])
    elsif input[1] == "save" &&  input[2] == "to" && input[3] != nil
      save(input[3])
    elsif input[1] == "export" && input[2] == "html" && input[3] != nil
      export(input[3])
    else
      try_again_next_command
    end
  end

  def erb_reader
    File.read "./data/attendee_queue.erb"
  end

  def export(input)
    erb = ERB.new erb_reader
    table = erb.result(binding)
    Dir.mkdir("html") unless Dir.exists? "html"
    file = "html/#{input}"
    File.open(file,"w") do |file|
      file.puts table
    end
    @queue.clear
  end

  def save(input)
    CSV.open("./data/#{input}", 'wb', headers: true) do |csv|
      csv << ['LAST NAME', 'FIRST NAME','EMAIL','ZIPCODE', 'CITY', 'STATE',
              'ADDRESS', 'PHONE']
          @queue.map do |attendee|
      csv << [attendee.last_name, attendee.first_name, attendee.email,
        attendee.zipcode, attendee.city,attendee.state, attendee.street,
        attendee.phone]
                end
    end
    @queue.clear
  end
end

ReporterInterface.new.start
