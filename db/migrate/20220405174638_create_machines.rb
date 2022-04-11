class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.string :zip
      t.string :name
      t.string :TYPE
      t.string :a0_name
      t.string :a1_name
      t.string :a2_name
      t.string :a3_name
      t.string :a4_name
      t.string :a5_name
      t.string :a6_name
      t.string :a7_name
      t.string :a8_name
      t.string :x_coordinate
      t.string :y_coordinate
      t.string :service_hours
      t.string :temp_service_hours
      t.string :temp_service_hours_until
      t.string :temp_service_hours_2
      t.string :temp_service_hours_2_until
      t.string :comment_est
      t.string :comment_eng
      t.string :comment_rus
      t.string :comment_lav
      t.string :comment_lit
      t.string :modified
      t.timestamps
    end
  end
end
