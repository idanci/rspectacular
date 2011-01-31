class PositivityMatcher < Shoulda::ActiveRecord::Matchers::ValidateNumericalityOfMatcher
  def matches?(positivitable)
    super(positivitable)

    disallows_zero_values &&
    disallows_negative_values
  end

  def failure_message
    "Expected #{@attribute.to_s} to be a positive number, got: #{pretty_error_messages(@attribute)}"
  end

  def negative_failure_message
    "Expected #{@attribute.to_s} to be a negative number, got: #{pretty_error_messages(@attribute)}"
  end

  def disallows_negative_values
    disallows_value_of(-1) &&
    disallows_value_of(-100)
  end

  def disallows_zero_values
    disallows_value_of(0)
  end

  def description
    "should be contain a positive number"
  end
end

def validate_positivity_of(date)
  PositivityMatcher.new(date)
end
