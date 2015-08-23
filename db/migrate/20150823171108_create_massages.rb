class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.string :fname
      t.string :lname
      t.date :service_date
      t.date :depost_date
      t.decimal :mc ,:precision => 8, :scale => 2
      t.decimal :visa ,:precision => 8, :scale => 2
      t.decimal :debit ,:precision => 8, :scale => 2
      t.decimal :cash,:precision => 8, :scale => 2
      t.decimal :tax,:precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
