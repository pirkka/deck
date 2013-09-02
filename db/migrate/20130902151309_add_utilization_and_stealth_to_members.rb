class AddUtilizationAndStealthToMembers < ActiveRecord::Migration
  def change
    add_column :members, :utilization, :string, :default => 1
    add_column :members, :stealth, :boolean, :default => true
  end
end
