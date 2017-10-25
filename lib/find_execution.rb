module FindExecution

  def find_executer(input)
    if input.length == 3
      standard_find(input)
    else
      extended_find(input)
    end
  end

  def find_by_extended_input(input)
    formatted = input.last(input.count - 2).join(" ")
    @queue = @reporter.data.find_all do |attendee|
      attendee.send(input[1].to_sym) == formatted.downcase
    end
  end

  def extended_find(input)
    find_by_extended_input(input)
    queue_loaded
    @queue
  end

  def find_by_standard_input(input)
  @queue = @reporter.data.find_all do |attendee|
    attendee.send(input[1].to_sym) == input[2].downcase
    end
  end

  def standard_find(input)
    find_by_standard_input(input)
    queue_loaded
    @queue
  end

end
