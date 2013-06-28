module QuickInsight
  module Core
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def insight(*args, block)
        key = args[0]
        # Determine parent class name
        klass_name = self.name.pluralize.underscore
        # Generate method name for new controller method
        controller_action = "#{klass_name}_#{key}"
        # Build route
        route = QuickInsight.build_route(klass_name, key, controller_action)
        # Inject new route into application
        Rails.application.routes.prepend { get route }
        # Define controller method that invokes block and renders the results as JSON
        QuickInsightController.class_eval do
          define_method controller_action do
            render json: { key => block.call }
          end
        end
      end
    end
  end

  private

  # Define route hash in format required by Rails router
  def self.build_route(klass_name, key, controller_action)
    { "/#{QuickInsight::default_route}/#{klass_name}/#{key}" => "quick_insight##{controller_action}" }
  end
end
