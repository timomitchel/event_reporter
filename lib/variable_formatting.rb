module VariableFormatting

  def check_for_attendee_instance_variable(input)
    instance_variable_strings.one? {|variable| variable == input[1]}
  end

  def variable_formatter
    @reporter.data.map {|attendee| attendee.instance_variables}.flatten.uniq
  end

  def string_maker
    variable_formatter.map {|variable| variable.to_s}
  end

  def instance_variable_strings
    string_maker.map {|variable| variable.delete('@')}
  end
end
