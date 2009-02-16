require 'active_merchant/billing/integrations/paymate/helper.rb'
require 'active_merchant/billing/integrations/paymate/notification.rb'
require 'active_merchant/billing/integrations/paymate/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Paymate
        mattr_accessor :test_url
        self.test_url = 'https://www.paymate.com/PayMate/TestExpressPayment'
        
        mattr_accessor :production_url 
        self.production_url = 'https://www.paymate.com/PayMate/ExpressPayment' 
        
        def self.service_url
          mode = ActiveMerchant::Billing::Base.integration_mode
          case mode
            when :production
              self.production_url    
            when :test
              self.test_url
            else
              raise StandardError, "Integration mode set to an invalid value: #{mode}"
          end
        end
        
        def self.notification(post)
          Notification.new(post)
        end
        
        def self.return(query_string)
          Return.new(query_string)
        end
      end
    end
  end
end
