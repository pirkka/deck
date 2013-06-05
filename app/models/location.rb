module Location
  
  def self.workspace_capacity
    ENV['CAPACITY'].to_i
  end
  
  def self.free_workspaces
    self.workspace_capacity - self.utilized_workspaces
  end
  
  def self.utilized_workspaces
    Member.all.count
  end
  
  def self.street_address
    ENV['STREET_ADDRESS']
  end

  def self.postcode
    ENV['POSTCODE']
  end

  def self.city
    ENV['CITY']
  end
  
  def self.lat
    ENV['LAT'].to_f
  end
  
  def self.lon
    ENV['LON'].to_f
  end
  
  def self.rent_for_potential_new_member
    (Invoice.total_costs / (Location.utilized_workspaces + 1)).round(2)
  end
  
end