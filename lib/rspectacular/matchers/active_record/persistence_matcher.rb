module RSpectacular
  module ActiveRecord
    module Matchers
      class PersistenceMatcher
        def initialize(persistable, options)
          @persistable_class  = persistable.is_a?(Class) ? persistable : persistable.class
          @desired_attributes = options[:with] || persistable.attributes
          @desired_attributes = @desired_attributes.reject {|k,v| ['id', 'created_at', 'updated_at'].include? k}
        end

        def matches?(subject)
          @persistable_class.where(@desired_attributes).first
        end

        def failure_message
          "Expected to find an object saved with #{@desired_attributes}, didn't find one."
        end

        def negative_failure_message
          "Didn't expect to find an object saved with #{@desired_attributes}, but got one anyway"
        end

        def description
          "should be an instance of #{@expected_class_name}"
        end
      end

      def persist(desired_object, options = {})
        PersistenceMatcher.new(desired_object, options)
      end

      alias :persist_the :persist
      alias :persist_a   :persist
      alias :persist_an  :persist
    end
  end
end
