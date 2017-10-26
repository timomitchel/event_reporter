module Output

  def restart_message
    puts "That is not an executable command.
    Please type 'load <filename>' then hit enter to load
    a custom csv file. Or, type 'load' then enter
    and Event Reporter will load the full_event_attendees.csv."
  end

  def restart_message_with_help
    puts "That is not a valid command. Enter a valid command
    or type 'help' to see a list of valid commands"
  end

  def intro
    puts "Hello please type 'load <filename>' and then hit enter to
          load a custom csv file. Or, type 'load' and hit enter to load our
          default csv file"
  end

  def try_again_first_command
    restart_message
    evaluate_first_command(input_splitter)
  end

  def try_again_next_command
    restart_message_with_help
  end

  def help_commands
  puts "\t    ________________________________________________________________
          ================================================================
          ||  Available Commands:                                        ||
          ||    load <filename>,
                find <attribute> <criteria>,                             ||
          ||    queue count, queue clear, queue print,                   ||
          ||    queue print by <attribute>,                              ||
          ||    queue save to <filename.csv>,                            ||
          ||    queue export html <filename.html>,
                help <command>,
                quit                                                     ||
          ================================================================
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          "
  end

  def print_queue_clear
    puts "Queue cleared! Use find to reload queue."
  end

  def file_loaded
    puts "Event Reporter file: --#{@reporter.filename}-- loaded and ready!"
  end

  def help_queue_count
    puts 'Prints out the count of attendees in the queue'
  end

  def help_queue_clear
    puts 'Clears all attendees from the queue. Queue is ready to be reloaded'
  end

  def help_queue_print
    puts "Prints out all elements currently in the queue. Use print by to sort
    by a specific attribute. ex: 'print by zipcode'"
  end

  def help_queue_save
    puts "Saves all elements of the queue as a csv in the data directory."
  end

  def help_queue_export
    puts "Exports all elements of queue to html file you name. ex:
    'queue export html <filename>.html'"
  end

  def find_help
    puts "Finds attendees by element that matches your input.
    ex: 'find state co' populates queue with attendees from Colorado"
  end

  def load_help
    puts "Loads a csv file to navigate. ex: load <filename>.csv
    If no filename is entered a default file is loaded to the program."
  end
end
