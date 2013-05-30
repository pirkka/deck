class Invoice
  
  attr_accessor :invoicee
  attr_accessor :invoicer
  
  def date
    Time.now.strftime("01.%m.%Y")
  end
  
  def taxless
    if Location.utilized_workspaces == 0
      return 0
    end
    (Invoice.total_costs / Location.utilized_workspaces).round(2)
  end
  
  def vat
    (self.taxless * Invoice.vat).round(2)
  end
  
  def total
    (self.taxless + self.vat).round(2)
  end
  
  def self.total_costs
    ENV['TOTAL_RENT'].to_f + ENV['TOTAL_SERVICES'].to_f
  end
  
  def self.vat
    ENV['VAT'].to_f
  end
  
end