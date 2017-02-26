class CreateShowtimes < ActiveRecord::Migration[5.0]
  def change
    create_table :showtimes do |t|
      t.references :movie, foreign_key: true
      t.references :auditorium, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :price
      t.integer :tickets_available

      t.timestamps
    end
  end
end
