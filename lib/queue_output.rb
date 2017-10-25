module QueueOutput

  def queue_loaded
    puts "Queue loaded with matching data!"
  end

  def print_queue
    print_headers
    print_formatted_queue
  end

  def print_formatted_queue
    @queue.flatten.each_with_index do |attendee, i|
       puts @format % [attendee.last_name, attendee.first_name,
                       attendee.email, attendee.zipcode, attendee.city,
                       attendee.state, attendee.street, attendee.phone]
     end
  end

  def sort_by_attribute(input)
    sorted = @queue.flatten.sort_by do |attendee|
      attendee.send(input.to_sym)
    end
    print_sorted_queue(sorted)
  end

  def print_sorted_queue(sorted)
    print_headers
    sorted.each_with_index do |attendee, i|
      puts @format % [attendee.last_name, attendee.first_name,
                      attendee.email, attendee.zipcode, attendee.city,
                      attendee.state, attendee.street, attendee.phone]
    end
  end

  def print_headers
    puts @format % ['LAST NAME', 'FIRST NAME',
                    'EMAIL','ZIPCODE', 'CITY', 'STATE',
                    'ADDRESS', 'PHONE']
  end
end
