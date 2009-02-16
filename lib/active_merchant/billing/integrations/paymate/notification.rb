module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Paymate
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          def complete?
            true
          end

          def status
            'Complete'  # Not supported by Paymate
          end

          # Unique ID of transaction
          def transaction_id
            params['transactionId']
          end

          # The item id passed in the first custom parameter
          def item_id
            params['ref']
          end
          
          def gross
            0.00      # Not supported by Paymate
          end
          
          def test?
            false
          end

          def acknowledge
            true
          end
        end
      end
    end
  end
end
