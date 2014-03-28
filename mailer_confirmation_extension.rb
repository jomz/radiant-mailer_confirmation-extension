require "radiant-mailer_confirmation-extension"

class MailerConfirmationExtension < Radiant::Extension
  version     RadiantMailerConfirmationExtension::VERSION
  description RadiantMailerConfirmationExtension::DESCRIPTION
  url         RadiantMailerConfirmationExtension::URL
  
  def activate
    Mail.send :include, MailerConfirmation::MailExtensions
  end
  
  def deactivate
  end
  
end
