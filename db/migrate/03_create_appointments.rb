class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.belongs_to :profile, foreign_key: true
      t.belongs_to :pet, foreign_key: true

      t.timestamps
    end
  end
end
