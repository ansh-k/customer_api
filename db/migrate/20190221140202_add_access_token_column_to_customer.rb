class AddAccessTokenColumnToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :access_token, :string
  end
end
