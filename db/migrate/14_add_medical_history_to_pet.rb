class AddMedicalHistoryToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :medical_history, :string
  end
end
