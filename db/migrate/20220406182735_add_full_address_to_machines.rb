class AddFullAddressToMachines < ActiveRecord::Migration[6.1]
  def change
    add_column :machines, :FULL_ADDRESS, :string
  end
end
