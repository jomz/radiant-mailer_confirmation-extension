module MailerConfirmation
  module MailExtensions
    
    def self.included(base)
      base.class_eval { 
        alias_method_chain :send, :confirmation 
      }
    end
    
    def send_with_confirmation
      if sent? && !page.part(:confirmation_email).nil? # Only if the original mail succeeded and confirmation mail is set up.
        confirmation_body = page.render_part( :confirmation_email )
        from_address = data[config[:confirmation_from_field]] || data[config[:from_field]] || config[:from]
        subject = config[:confirmation_subject] || "Confirmation email"

        headers = { 'Reply-To' => from_address, 'Return-Path' => from_address, 'Sender' => from_address }
        recipients = data[config[:confirmation_recipients_field]].split(/,/).collect{|e| e.strip}
        
        raise StandardError, "Recipients field was left blank, email not sent." if recipients.empty?

        Mailer.deliver_generic_mail(
          :recipients => recipients,
          :from => from_address,
          :subject => subject,
          :plain_body => confirmation_body,
          :headers => headers
        )
        send_without_confirmation
      else
        send_without_confirmation
      end
    end
    
  end
end