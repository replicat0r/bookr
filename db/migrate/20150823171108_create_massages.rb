class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.string :fname
      t.string :lname
      t.string :receipt_num
      t.date :service_date
      t.date :depost_date
      t.string :cardtype
      t.decimal :amount ,:precision => 8, :scale => 2

      t.decimal :tax,:precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
