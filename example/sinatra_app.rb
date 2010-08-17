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