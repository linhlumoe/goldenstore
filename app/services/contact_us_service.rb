class ContactUsService
  extend LightService::Organizer

  def self.call(params, request)
    with(params: params, request: request).reduce(SendEmailAction)
  end

  class SendEmailAction
    extend LightService::Action
    expects :params, :request

    executed do |context|
      contact = Contact.new contact_params(context)
      contact.request = context.request
      contact.deliver
    end

    def self.contact_params(context)
      context.params.permit([
        :name,
        :email,
        :message
      ])
    end
  end
end
