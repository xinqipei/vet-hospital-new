class AddSexToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :sex, :string
  end
end
