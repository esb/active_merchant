module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Paymate
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          def initialize(order, account, options = {})
            super
            add_field('amt_editable', 'N')
            add_field('popup', 'false')
          end

          mapping :invoice, 'ref'
          # mapping :order, '???' # This is the order.id
          mapping :account, 'mid'
          mapping :amount, 'amt'
          mapping :currency, 'currency'
          
          mapping :customer, :first_name => 'pmt_contact_firstname',
                             :last_name => 'pmt_contact_surname',
                             :phone => 'pmt_contact_phone',
                             :email => 'pmt_sender_email'
          
          mapping :billing_address, :city => 'regindi_sub',
                                    :address1 => 'regindi_address1',
                                    :address2 => 'regindi_address2',
                                    :state => 'regindi_state',
                                    :zip => 'regindi_pcode',
                                    :country => 'pmt_country'
          
          mapping :notify_url, 'notify'
          mapping :return_url, 'return'
        end
      end
    end
  end
end


