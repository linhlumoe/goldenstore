class ContactsController < ApplicationController
  layout 'pages'
  def new
    @contact = Contact.new
  end

  def create
    result = ContactUsService.call contact_params, request
    if result.success?
      redirect_to '/contacts', notice: 'Thank you for your message. We will contact you soon!'
    else
      render :new, error: result.message
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
