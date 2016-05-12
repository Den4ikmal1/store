class RemoveColumnToCitiesAddressTo < ActiveRecord::Migration
  def change
    remove_column :cities, :address_to
  end
end
