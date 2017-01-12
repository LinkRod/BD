class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      # Completa con las columnas que necesites
      t.integer :num_flight
      t.date :date
      t.date :depart
      t.string :from
      t.string :to
      t.time :duration
      t.float :cost
      t.integer :passengers
      t.timestamps
    end

    create_table :users do |t|
    	# Completa con las columnas que necesites
      t.string :name
      t.string :email
      t.string
      t.timestamps
    end

    #crea las tablas restantes
    create_table :bookings do |t|
      t.integer :num_booking
      t.integer :total
      t.timestamps
    end

    create_table :userbookings do |t|
      t.integer :userid
      t.integer :bookingid
      t.timestamps
    end

    create_table :userflights do |t|
      t.integer :userid
      t.integer :flightid
      t.timestamps
    end
  end
end
