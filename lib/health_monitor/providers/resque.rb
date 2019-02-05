require 'health_monitor/providers/base'
require 'resque'

module HealthMonitor
  module Providers
    class ResqueException < HealthMonitor::Error; end

    class Resque < Base
      def check!
        ::Resque.info
      rescue Exception => e
        raise ResqueException.new(e.message)
      end
    end
  end
end
