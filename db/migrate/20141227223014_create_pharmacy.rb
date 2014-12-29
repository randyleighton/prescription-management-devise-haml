class CreatePharmacy < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :phone
      t.text :url
    end
  end
end