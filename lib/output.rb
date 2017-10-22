
module Output

  def restart_message
    puts "That is not an executable command.
    Please enter a valid csv file after
    load or we will load the full_event_attendees.csv
    if you type load and then hit enter."
  end

  def restart_message_with_help
    puts "That is not a valid command. Enter a valid command
    or type 'help' to see a list of valid commands"
  end

  def intro
    puts "Hello please type 'load' and the file you would like to load"
  end

end
