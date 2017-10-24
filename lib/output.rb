
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

  def print_queue_clear
    puts "Queue cleared! Use find to reload queue."
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

  def collect_last_names
    @queue.flatten.map {|attendee| attendee.last_name}
  end

  def queue_output_formatter
    formatter = ""
    collect_last_names.each {|name| formatter += "#{name}\n"}
    formatter
  end

  def collect_first_names
    @queue.flatten.map {|attendee| attendee.first_name}
  end

  def collect_emails
    @queue.flatten.map {|attendee| attendee.email}
  end

  def collect_zipcodes
    @queue.flatten.map {|attendee| attendee.zipcode}
  end

  def collect_cities
    @queue.flatten.map {|attendee| attendee.city}
  end

  def collect_states
    @queue.flatten.map {|attendee| attendee.state}
  end

  def collect_streets
    @queue.flatten.map {|attendee| attendee.street}
  end

  def collect_phone_numbers
    @queue.flatten.map {|attendee| attendee.phone}
  end

  def print_queue
    table(border: false) do
      row do
        column("LAST NAME", width:14)
        column("FIRST NAME", width: 14)
        column("EMAIL",width: 33)
        column("ZIPCODE",width: 7)
        column("CITY",width: 15)
        column("STATE",width: 5)
        column("ADDRESS",width: 25)
        column("PHONE",width: 15)
      end
      row do
        column("#{queue_output_formatter}", align: "left")
        column("#{collect_first_names}")
        column("#{collect_emails}")
        column("#{collect_zipcodes}")
        column("#{collect_cities}")
        column("#{collect_states}")
        column("#{collect_streets}")
        column("#{collect_phone_numbers}")
      end
    end
  end
end
