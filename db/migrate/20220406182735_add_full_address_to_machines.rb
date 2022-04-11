class AddFullAddressToMachines < ActiveRecord::Migration[6.1]
  def change
    add_column :machines, :full_address, :string
  end
end
