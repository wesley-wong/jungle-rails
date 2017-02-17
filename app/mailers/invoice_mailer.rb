class InvoiceMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def invoice_email(order)
    @order = order
    mail(
      to: @order.email,
      subject: 'Order Confirmation'
    )
  end

end
