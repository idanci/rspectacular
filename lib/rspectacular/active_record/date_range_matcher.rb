module RSpectacular
  module ActiveRecord
    module Matchers
      class DateRangeMatcher
        include Shoulda::ActiveRecord::Helpers

        def initialize(dates)
          @begin_field  = dates[:from].to_s
          @end_field    = dates[:to].to_s

          @begin_method = "#{dates[:from].to_s}=".to_sym
          @end_method   = "#{dates[:to].to_s}=".to_sym
        end

        def matches?(rangeable)
          @rangeable = rangeable
          beginning_date = Date.today
          ending_date = Date.today - 1

          rangeable.send(@begin_method, beginning_date)
          rangeable.send(@end_method, ending_date)

          rangeable.valid?

          rangeable.errors[@begin_field].include?("must be on or before #{ending_date.to_s}") &&
          rangeable.errors[@end_field].include?("must be on or after #{beginning_date.to_s}")
        end

        def failure_message
          "#{@rangeable_class} should only accept a valid date range from #{@begin_field} to #{@end_field}, got: #{pretty_error_messages(@rangeable)}"
        end

        def negative_failure_message
          "#{@rangeable_class} shouldn't accept a valid date range from #{@begin_field} to #{@end_field}, got: #{pretty_error_messages(@rangeable)}"
        end

        def description
          "should be contain a valid range for #{@rangeable_class}"
        end
      end

      def validate_date_range(dates)
        DateRangeMatcher.new(dates)
      end
    end
  end
end
