# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class InvoiceMailerPreview < ActionMailer::Preview

  def invoice_mail_preview
    InvoiceMailer.invoice_email(Order.last)
  end

end