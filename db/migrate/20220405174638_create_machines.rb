class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.string :ZIP
      t.string :NAME
      t.string :TYPE
      t.string :A0_NAME
      t.string :A1_NAME
      t.string :A2_NAME
      t.string :A3_NAME
      t.string :A4_NAME
      t.string :A5_NAME
      t.string :A6_NAME
      t.string :A7_NAME
      t.string :A8_NAME
      t.string :X_COORDINATE
      t.string :Y_COORDINATE
      t.string :SERVICE_HOURS
      t.string :TEMP_SERVICE_HOURS
      t.string :TEMP_SERVICE_HOURS_UNTIL
      t.string :TEMP_SERVICE_HOURS_2
      t.string :TEMP_SERVICE_HOURS_2_UNTIL
      t.string :comment_est
      t.string :comment_eng
      t.string :comment_rus
      t.string :comment_lav
      t.string :comment_lit
      t.string :MODIFIED
      t.timestamps
    end
  end
end
