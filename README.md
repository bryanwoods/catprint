About:
======
This is a simple wrapper around CatPrint's ActionPrint API, allowing developers to interact with the service in pure Ruby.

Documentation and More Information:
===================================
    https://docs.google.com/View?id=dd5gnbcf_80cf4x2qf8
    http://www.catprint.com/action_print

(Hopefully) Sensible Defaults:
==============================
Most of the time attributes default to nil, but the following defaults were chosen:
    production_center_id       = 1
    payment_method             = "pay_on_account"
    shipping_speed             = 7
    job_copies                 = 1
    job_full_bleed             = true
    job_paper_id               = "HCS1SG"
    job_finishing_option_id    = "1F"
    job_fold_across_long_edge  = true
    job_front_imaging          = "color"
    job_back_imaging           = "blank"
    job_flip_on_long_edge      = true
    job_pages                  = 1
    panel_number               = 1
    page_number                = 1
    rotation                   = 0

Installation:
=============
    (sudo) gem install catprint

Here is an example Sinatra application to get you going:
--------------------------------------------------------

    require 'rubygems'
    require 'sinatra'
    require 'catprint'

    get '/' do
      @catprint = CatPrint.new
      @catprint.email = "YOUR_ACCOUNT_EMAIL"
      @catprint.password = "YOUR_ACCOUNT_PASSWORD"
      @catprint.payment_method = "credit_card"
      @catprint.payment_amount = "12.35"
      @catprint.card_expiration = "2011-11-01"
      @catprint.card_number = "4111111111111111"
      @catprint.card_type = "Visa"
      @catprint.billing_name = "Name"
      @catprint.billing_address_1 = "101 High Street"
      @catprint.billing_city = "Rochester"
      @catprint.billing_state = "NY"
      @catprint.billing_zip = "14617"
      @catprint.billing_country = "US"
      @catprint.billing_phone = "585-278-6308"
      @catprint.shipping_name = "Customers Name"
      @catprint.shipping_address_1 = "92 Station Rd"
      @catprint.shipping_city = "Rochester"
      @catprint.shipping_state = "NY"
      @catprint.shipping_zip = "14617"
      @catprint.job_name = "5 X 7 Greeting Card Job (10 X 7 single fold)"
      @catprint.job_width = "720.00"
      @catprint.job_height = "504.00"
      @catprint.panel_source_file = "http://www.catprint.com/action_print_samples/sample_pdf_greeting_card.pdf"
      response = @catprint.send_job(@catprint.action_print_job_xml)
      response.body.to_s
    end