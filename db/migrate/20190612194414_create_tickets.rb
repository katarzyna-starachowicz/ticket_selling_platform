class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.float :price_amount
      t.string :price_currency
      t.string :status
      t.string :reservation_token
      t.string :bought_by
    end
  end
end
