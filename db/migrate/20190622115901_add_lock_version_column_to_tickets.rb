class AddLockVersionColumnToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :lock_version, :integer, default: 0
  end
end
