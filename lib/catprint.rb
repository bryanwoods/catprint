require 'rubygems'
require 'httparty'

class CatPrint
  include HTTParty
  attr_accessor :email,
                :password,
                :production_center_id,
                :payment_method,
                :payment_amount,
                :card_expiration,
                :card_number,
                :card_type,
                :card_holder_first_name,
                :card_holder_last_name,
                :billing_company,
                :billing_name,
                :billing_address_1,
                :billing_address_2,
                :billing_city,
                :billing_state,
                :billing_zip,
                :billing_country,
                :billing_phone,
                :shipping_company,
                :shipping_name,
                :shipping_address_1,
                :shipping_address_2,
                :shipping_city,
                :shipping_state,
                :shipping_zip,
                :shipping_country,
                :shipping_phone,
                :shipping_speed,
                :shipping_instructions,
                :drop_ship_company,
                :drop_ship_address_1,
                :drop_ship_address_2,
                :drop_ship_city,
                :drop_ship_state,
                :drop_ship_zip,
                :drop_ship_country,
                :drop_ship_phone,
                :drop_ship_packing_slip_url,
                :job_name,
                :job_copies,
                :job_width,
                :job_height,
                :job_full_bleed,
                :job_paper_id,
                :job_envelope_id,
                :job_finishing_option_id,
                :job_fold_across_long_edge,
                :job_front_imaging,
                :job_back_imaging,
                :job_flip_on_long_edge,
                :job_pages,
                :panel_source_file,
                :panel_number,
                :page_number,
                :rotation

  def initialize
    @action_print_job_xml       = action_print_job_xml
    @production_center_id       = production_center_id
    @payment_method             = payment_method
    @shipping_speed             = shipping_speed
    @job_copies                 = job_copies
    @job_full_bleed             = job_full_bleed
    @job_paper_id               = job_paper_id
    @job_finishing_option_id    = job_finishing_option_id
    @job_fold_across_long_edge  = job_fold_across_long_edge
    @job_front_imaging          = job_front_imaging
    @job_back_imaging           = job_back_imaging
    @job_flip_on_long_edge      = job_flip_on_long_edge
    @job_pages                  = job_pages
    @panel_number               = panel_number
    @page_number                = page_number
    @rotation                   = rotation
  end

  base_uri "http://www.catprint.com"

  def send_job(body)
    self.class.post "/action_print", :body => { :email => @email,
                                                :password => @password,
                                                :action_print_job_xml => body }
  end

  def production_center_id
    @production_center_id.nil? ? 1 : @production_center_id
  end

  def payment_method
    @payment_method.nil? ? "pay_on_account" : @payment_method
  end

  def shipping_speed
    @shipping_speed.nil? ? 7 : @shipping_speed
  end

  def job_copies
    @job_copies.nil? ? 1 : @job_copies
  end

  def job_full_bleed
    @job_full_bleed.nil? ? true : @job_full_bleed
  end

  def job_paper_id
    @job_paper_id.nil? ? "HCS1SG" : @job_paper_id
  end

  def job_finishing_option_id
    @job_finishing_option_id.nil? ? "1F" : @job_finishing_option_id
  end

  def job_fold_across_long_edge
    @job_fold_across_long_edge.nil? ? true : @job_fold_across_long_edge
  end

  def job_front_imaging
    @job_front_imaging.nil? ? "color" : @job_front_imaging
  end

  def job_back_imaging
    @job_back_imaging.nil? ? "blank" : @job_back_imaging
  end

  def job_flip_on_long_edge
    @job_flip_on_long_edge.nil? ? true : @job_flip_on_long_edge
  end

  def job_pages
    @job_pages.nil? ? 1 : @job_pages
  end

  def panel_number
    @panel_number.nil? ? 1 : @panel_number
  end

  def page_number
    @page_number.nil? ? 1 : @page_number
  end

  def rotation
    @rotation.nil? ? 0 : @rotation
  end

  def action_print_job_xml(*args)
    action_print_job_xml = <<-EOF
  <?xml version="1.0" encoding="UTF-8"?>
  <action-print-job>
    <production-center-id type="integer">#{@production_center_id}</production-center-id>
    <submitter-id>#{@email}</submitter-id>
    <submitter-password>#{@password}</submitter-password>
    <payment-method>#{@payment_method}</payment-method>
    <payment-amount>#{@payment_amount}</payment-amount>
    <payment-profile-cc-expiration>#{@card_expiration}</payment-profile-cc-expiration>
    <payment-profile-cc-number>#{@card_number}</payment-profile-cc-number>
    <payment-profile-cc-type>#{@card_type}</payment-profile-cc-type>
    <payment-profile-first-name>#{@card_holder_first_name}</payment-profile-first-name>
    <payment-profile-last-name>#{@card_holder_last_name}</payment-profile-last-name>
    <billing-company>#{@billing_company}</billing-company>
    <billing-name>#{@billing_name}</billing-name>
    <billing-address-1>#{@billing_address_1}</billing-address-1>
    <billing-address-2>#{@billing_address_2}</billing-address-2>
    <billing-city>#{@billing_city}</billing-city>
    <billing-state>#{@billing_state}</billing-state>
    <billing-zip>#{@billing_zip}</billing-zip>
    <billing-country>#{@billing_country}</billing-country>
    <billing-phone>#{@billing_phone}</billing-phone>
    <shipping-company>#{@shipping_company}</shipping-company>
    <shipping-name>#{@shipping_name}</shipping-name>
    <shipping-address-1>#{@shipping_address_1}</shipping-address-1>
    <shipping-address-2>#{@shipping_address_2}</shipping-address-2>
    <shipping-city>#{@shipping_city}</shipping-city>
    <shipping-state>#{@shipping_state}</shipping-state>
    <shipping-zip>#{@shipping_zip}</shipping-zip>
    <shipping-country>#{@shipping_country}</shipping-country>
    <shipping-phone>#{@shipping_phone}</shipping-phone>
    <shipping-speed>#{@shipping_speed}</shipping-speed>
    <shipping-instructions>#{@shipping_instructions}</shipping-instructions>
    <drop-ship-company>#{@drop_ship_company}</drop-ship-company>
    <drop-ship-address-1>#{@drop_ship_address_1}</drop-ship-address-1>
    <drop-ship-address-2>#{@drop_ship_address_2}</drop-ship-address-2>
    <drop-ship-city>#{@drop_ship_city}</drop-ship-city>
    <drop-ship-state>#{@drop_ship_state}</drop-ship-state>
    <drop-ship-zip>#{@drop_ship_zip}</drop-ship-zip>
    <drop-ship-country>#{@drop_ship_country}</drop-ship-country>
    <drop-ship-phone>#{@drop_ship_phone}</drop-ship-phone>
    <drop-ship-packing-slip-url>#{@drop_ship_packing_slip_url}</drop-ship-packing-slip-url>
    <jobs type="array">
      <job>
        <name>#{@job_name}</name>
        <copies>#{@job_copies}</copies>
        <width>#{@job_width}</width>
        <height>#{@job_height}</height>
        <full-bleed>#{@job_full_bleed}</full-bleed>
        <paper-id>#{@job_paper_id}</paper-id>
        <envelope-id>#{@job_envelope_id}</envelope-id>
        <finishing-option-id>#{@job_finishing_option_id}</finishing-option-id>
        <fold-across-long-edge>#{@job_fold_across_long_edge}</fold-across-long-edge>
        <front-imaging>#{@job_front_imaging}</front-imaging>
        <back-imaging>#{@job_back_imaging}</back-imaging>
        <flip-on-long-edge>#{@job_flip_on_long_edge}</flip-on-long-edge>
        <pages>#{@job_pages}</pages>
        <panels type="array">
          <panel>
            <panel-source-file>#{@panel_source_file}</panel-source-file>
            <panel-number>#{@panel_number}</panel-number>
            <page-number>#{@page_number}</page-number>
            <rotation>#{@rotation}</rotation>
          </panel>
        </panels>
      </job>
    </jobs>
  </action-print-job>
    EOF
  end
end