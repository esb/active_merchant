module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Paymate
        class Return < ActiveMerchant::Billing::Integrations::Return
          SUCCESS = "PA"
          CODES = { "PA" => "Payment is approved",
                    "PD" => "Payment is declined",
                    "PP" => "Payment is processing"
                  }
                  
          def success?
            params['responseCode'] == SUCCESS
          end
         
          def message
            CODES[params['responseCode']]
          end
          
          def status
            params['responseCode']
          end
        
          def transaction_id
            params['transactionID']
          end
        
          def gross
            params['paymentAmount'].to_f
          end
	      end
      end
    end
  end
end
