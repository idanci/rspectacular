class TruthfulnessMatcher < Shoulda::ActiveRecord::Matchers::ValidationMatcher
  def matches?(truthable)
    super(truthable)

    allows_true &&
    allows_false &&
    disallows_nil
  end

  def allows_true
    allows_value_of(true)
  end

  def allows_false
    allows_value_of(false)
  end

  def disallows_nil
    disallows_value_of(nil)
  end

  def description
    "should accept only boolean true or false values"
  end
end

def validate_truthfulness_of(truthteller)
  TruthfulnessMatcher.new(truthteller)
end
