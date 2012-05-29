class Mailer < ActionMailer::Base
  default_url_options.merge(
    DefaultUrlOptions
  )

  default(
    :from => 'info@theatr.co'
  )
  
  def test(email)
    mail(:to => email, :from => 'will@theatr.co', :subject => 'test')
  end

  def contact_email(email_params)
    mail(
      :to => 'info@theatr.co',
      :from => email_params[:email],
      :subject => email_params[:subject],
      :body => email_params[:comments],
      :email => email_params[:email],
      :content_type => 'text/html',
    )
  end

protected
  def subject_for(*args)
    ["[#{ App.domain }]", *args.compact.flatten].join(' ')
  end

  def signature
    "-- Thanks from the #{ App.domain } team."
  end
  helper_method :signature
end
