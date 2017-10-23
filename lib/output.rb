
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

  def help
    puts ""
  end

  def print_headers
    puts "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
  end

  def file_loaded
    puts "Event Reporter file: --#{@reporter.filename}-- loaded and ready!"
  end

end
