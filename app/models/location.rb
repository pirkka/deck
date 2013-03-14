module Location
  
  def self.workspace_capacity
    12
  end
  
  def self.free_workspaces
    12 - Member.all.count
  end
  
end