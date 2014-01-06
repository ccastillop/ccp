class ContactMailer < ActionMailer::Base
  default from: "me@cristiancastillo.com"

  def new(contact)
    @contact = contact
    mail(to: "ccastillop@gmail.com", subject: "Nuevo contacto en SbD #{contact.id}")
  end
end
