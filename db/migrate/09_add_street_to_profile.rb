class AddStreetToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :street, :string
  end
end
