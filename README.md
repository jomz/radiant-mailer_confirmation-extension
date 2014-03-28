# Mailer Confirmation

Allows you to set up a second email to the form submitter that differs from the email sent to regular mail receiver. 

## Requirements

[Radiant Mailer extension](https://github.com/radiant/radiant-mailer-extension/) is required.

## Configuration

Create a page part 'confirmation_email' in which you can compose the email in the same way as in the usual 'email' page part. There is no code to cater for 'confirmation_html_email'. If you need that functionality and write it yourself, please send me a pull request. If you would like you can [contact me](mailto:hi@monkeypatch.be) to write this for you for a small fee.

In the 'mailer' page part, add these fields:

		confirmation_from_field: foo@example.com

The from: that will be used for the confirmation mail. This is optional; if not present this will default to the 'from_field' or 'from' config entries.

		confirmation_subject: Thank you for reaching out to us

The subject of the confirmation email. Will default to 'Confirmation email'.

		confirmation_recipients_field: email

This is the only required field. It defines in which POSTed form field the recipient of the confirmation mail can be found.
Unlike the mailer extension, there is no 'confirmation_recipients' config entry, as it didn't make sense to me.