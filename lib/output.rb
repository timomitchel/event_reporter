
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

  def queue_loaded
    puts "Queue loaded with matching data!"
  end

  def grab_last_names
    @queue.flatten.map {|attendee| attendee.last_name}
  end

  def grab_first_names
    @queue.flatten.map {|attendee| attendee.first_name}
  end

  def grab_emails
    @queue.flatten.map {|attendee| attendee.email}
  end

  def grab_zipcode
    @queue.flatten.map {|attendee| attendee.zipcode}
  end

  def grab_city
    @queue.flatten.map {|attendee| attendee.city}
  end

  def grab_state
    @queue.flatten.map {|attendee| attendee.state}
  end

  def grab_street
    @queue.flatten.map {|attendee| attendee.street}
  end

  def grab_phone
    @queue.flatten.map {|attendee| attendee.phone}
  end

  def print_queue
    table(border: false) do
      row do
        column("LAST NAME", width: 14)
        column("FIRST NAME", width: 14)
        column("EMAIL",width: 30)
        column("ZIPCODE",width: 7)
        column("CITY",width: 15)
        column("STATE",width: 5)
        column("ADDRESS",width: 20)
        column("PHONE",width: 15)
      end
      row do
        column("#{grab_last_names.to_s}")
        column("#{grab_first_names}")
        column("#{grab_emails}")
        column("#{grab_zipcode}")
        column("#{grab_city}")
        column("#{grab_state}")
        column("#{grab_street}")
        column("#{grab_phone}")
      end
    end
  end

end
