class AddMemberDetails < ActiveRecord::Migration
  def up
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :company, :string
    add_column :members, :url, :string
    add_column :members, :y_code, :string
    add_column :members, :street_address, :string
    add_column :members, :postcode, :string
    add_column :members, :city, :string
    add_column :members, :linkedin, :string
    add_column :members, :twitter, :string
    add_column :members, :phone, :string
  end

  def down
  end
end
