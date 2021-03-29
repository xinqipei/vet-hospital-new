class AddLanguageToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :language, :string
  end
end
