class AddStateToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :state, :string
  end
end
