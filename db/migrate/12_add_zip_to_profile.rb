class AddZipToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :zip, :bigint
  end
end
