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
    ENV['LAT']
  end
  
  def self.lon
    ENV['LON']
  end
  
end