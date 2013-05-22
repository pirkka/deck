class HomeController < ApplicationController

  def index
    @members = Member.all
    render :layout => 'public'
  end
  
  def invoice
    @invoice = Invoice.new
    @invoice.invoicer = Member.find(ENV['INVOICER_ID'])
    @invoice.invoicee = current_member
    # render :layout => 'invoice'
  end
end
