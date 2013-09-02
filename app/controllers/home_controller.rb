class HomeController < ApplicationController

  def index
    @members = Member.all.reject {|x| x.stealth? }
    render :layout => 'public'
  end
  
  def invoice
    @invoice = Invoice.new
    @invoice.invoicer = Member.find(ENV['INVOICER_ID'])
    @invoice.invoicee = current_member
    # render :layout => 'invoice'
  end

  def printout
    @members = Member.all
    render :layout => nil
  end
  
  def ping
    render :text => 'a-ok'
  end
  
  def members
    authenticate_member!
  end
end
