class Mailer < ActionMailer::Base
  default from: "Form Mailer | Knokenetz <form.mailer@knokenetz.de>"
  layout 'mailer'

  def contact_email(post)
    @form_name = post.form.name
    @text = JSON.parse(post.content)
    @to = post.form.receiver
    mail(to: @to, subject: "Neue Nachricht | #{post.form.name}")
  end

end
