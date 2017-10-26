module HelpExecuter

  def help_executer(input)
    if input.length == 1
      help_commands
    else
      help_specific(input)
    end
  end

  def queue_helps(input)
    case input[2]
    when 'count' then help_queue_count
    when 'clear' then help_queue_clear
    when 'print' then help_queue_print
    when 'save' then help_queue_save
    when 'export' then help_queue_export
    end
  end

  def help_specific(input)
    case input[1]
      when 'queue' then queue_helps(input)
      when 'find' then find_help
      when 'load' then load_help
    end
  end

end
