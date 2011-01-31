class DatelinessMatcher
  include Shoulda::ActiveRecord::Helpers

  def initialize(date_field)
    @date_field  = date_field.to_s
    @date_method = "#{date_field.to_s}=".to_sym
  end

  def matches?(dateable)
    @dateable = dateable
    dateable.send(@date_method, Date.today)

    dateable.valid?

    !dateable.errors[@date_field].include?("is not a valid date")
  end

  def failure_message
    "Expected #{@date_field} to contain a valid date, got: #{pretty_error_messages(@dateable)}"
  end

  def negative_failure_message
    "Expected #{@date_field} to contain an invalid date, got: #{pretty_error_messages(@dateable)}"
  end

  def description
    "should be contain a valid date"
  end
end

def validate_dateliness_of(date)
  DatelinessMatcher.new(date)
end
