if Rails.env.production? or ENV['RAILS_EMAIL']
  Rails.configuration.action_mailer.delivery_method = :smtp
  Rails.configuration.action_mailer.perform_deliveries = true
  Rails.configuration.action_mailer.raise_delivery_errors = true

  Rails.configuration.action_mailer.smtp_settings = {
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'gmail.com',
    :authentication       => :plain,
    :user_name            => 'info@theatr.co',
    :password             => 'secret_pswd',
    :enable_starttls_auto => :true,
  }

  abort("YOU NEED TO EDIT #{ File.expand_path(__FILE__) }") if
    Rails.configuration.action_mailer.smtp_settings[:password] == 'PASSWORD'
end



### use this for debugging smtp connection errors

if ENV['SMTP_DEBUG']
  class Net::SMTP
    Initialize = instance_method(:initialize)

    def initialize(*args, &block)
      Initialize.bind(self).call(*args, &block)
    ensure
      @debug_output = STDERR
    end
  end
end
