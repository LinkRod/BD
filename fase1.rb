Examen 2 Fase 1

Registro de Vuelos
Usando el paradigma MVC vas a crear un programa que lleve reservaciones de vuelo, para esto usarás métodos de ActiveRecord, puedes tomar como ejemplo el ejercicio Todos en Esteroides. Descarga el siguiente esqueleto y modifícalo de acuerdo a lo que necesites:

El programa deberá considerar lo siguiente:

a) Bienvenida

Menú de Bienvenida:

Bienvenido a Vuelos Codea
--------------------------------------------------
1) Reservaciones
2) Administrador
3) Salir

Selecciona opción: 
b) Administrador

Bienvenido Administrador
--------------------------------------------------
Ingrese usuario:

Ingrese contraseña:
Es importante contemplar el registro de usuarios. La clase User deberá considerar los siguientes atributos: name, email, admin.

Menú de administrador:

Bienvenido Administrador
--------------------------------------------------
1) Muestra todos los vuelos
2) Muestra todas las reservaciones
3) Crea un nuevo vuelo
4) Salir

Selecciona opción:
Para crear un registro de vuelos, los destinos son de tu elección. La clase Flight deberá considerar los siguientes atributos: num_flight, date, depart, from, to, duration, cost, passengers.

c) Reservaciones

Menú de reservaciones:

--------------------------------------------------
                ¡¡¡Bienvenido!!!     
--------------------------------------------------

1) Encuentra tu boleto de avión
2) Salir

Selecciona una opción:
El usuario podrá buscar vuelos (flights):

--------------------------------------------------
            ¡¡¡Encuentra tu vuelo!!!
--------------------------------------------------
From:
Western Sahara
To:
Saudi Arabia
Date:
2015-06-15
Passengers (1, 2, 3, 4...):
3
El usuario podrá seleccionar un vuelo disponible:

Vuelos disponibles From: Western Sahara To: Saudi Arabia 
---------------------------------------------------------------------
1) No Vuelo: 96384
Date: 2015-06-15 , Depart: 11:17:16 UTC From: Western Sahara, 
To: Saudi Arabia, Duration: 7:00:00, Precio: 829.50, Lugares: 8
---------------------------------------------------------------------
2) No Vuelo :35472
Date: 2015-06-15 , Depart: 13:36:40 UTC From: Western Sahara, 
To: Saudi Arabia, Duration: 7:00:00, Precio: 748.45, Lugares: 10
---------------------------------------------------------------------
3) No Vuelo :63669
Date: 2015-06-15 , Depart: 14:47:27 UTC From: Western Sahara, 
To: Saudi Arabia, Duration: 7:00:00, Precio: 4434.0, Lugares: 23
...

Selecciona tu vuelo: 3 
El usuario podrá realizar reservaciones de vuelo, la clase Booking (reservación) deberá considerar lo siguiente:

Información de vuelo(No. Vuelo, Date, Depart, from - to, Duration, Precio).
Passengers Information: Name, Email.
Atributos de la clase Booking: num_booking, total, flight_id.
Reservación de vuelo:

-------------------------------------------------------------------------
Número de Vuelo Seleccionado: 47615
-------------------------------------------------------------------------    
Date: 2015-06-15, Depart: 14:47:27
From: Western Sahara, To: Saudi Arabia, Duration: 7:00:00, Precio: 4434.0
-------------------------------------------------------------------------

Datos de Persona 1:

Ingresa tu nombre :
Magick J.
email:
magick@gmail.com

Datos de Persona 2:

Ingresa tu nombre :
Michael K.
email:
michael@gmail.com

Datos de Persona 3:

Ingresa tu nombre :
Santi M.
email:
santi@gmail.com

#El número de datos de persona dependerá del número de passengers.

Realizar reservación: SI / NO
El usuario podrá ver el Ticket de la reservación realizada:

******************************
Reservación correcta
******************************

El costo total es de $13302.00
Y tu ID de reservación es la siguiente 1701-3
TIPS:

Diseña la base de datos basada en los siguientes requerimientos:

Un User puede tener muchos Flights.
Un Flight puede tener muchos Users.
Un Flight tiene muchas Bookings.
Una Booking pertenece a un solo Flight.
Una Booking tiene muchos Users.
Un User tiene muchas Bookings.
Para ejecutar el programa usa el archivo flight.rb.

En el archivo db/seeds.rb crea entre 10 y 15 registros de prueba utilizando los métodos de ActiveRecord.
