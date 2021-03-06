class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :practice_name
      t.string :office_phone
      t.string :email
      t.integer :user_id
    end
    add_column :prescriptions, :doctor_id, :integer
  end
end
