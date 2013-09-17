# Load the rails application
require File.expand_path('../application', __FILE__)

require 'tlsmail'
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => "xxxxxxx@gmail.com", #Your user name
    :password             => "xxxxxxx", # Your password
    :authentication       => :plain
}
# Initialize the rails application
TeacherOrder::Application.initialize!
