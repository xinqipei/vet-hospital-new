class AddAgeToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :age, :string
  end
end
