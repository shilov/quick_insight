require 'active_record/base'
require 'quick_insight/core'

module QuickInsight
  autoload :QuickInsightController, 'quick_insight/quick_insight_controller'

  # Define default scope for insight methods
  mattr_accessor :default_route
  @@default_route ||= 'qi'

  def quick_insight(options = {})
    include QuickInsight::Core unless self.included_modules.include?(QuickInsight::Core)
  end
end

# Enable use of QI methods in ActiveRecord models
ActiveRecord::Base.send :extend, QuickInsight
