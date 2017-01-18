class View
  # Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:
  
  def display_welcome_menu
    puts "Bienvenido a Vuelos Codea"
    puts "-"*50
    puts "1) Reservaciones"
    puts "2) Administrador"
    puts "3) Salir"
    puts
    puts "Selecciona opción:"
    input = gets.chomp
    input
  end

  def display_reservations_menu
    puts "-"*50
    puts "          ¡¡¡Bienvenido!!!"
    puts "-"*50
    puts 
    puts "1) Encuentra tu boleto de avión"
    puts "2) Salir"
    puts "Selecciona una opción:"
    input = gets.chomp
    input
  end  
 
  def collect_info_for_flight_search
    flight_to_find = []
    puts "-"*50
    puts "          ¡¡¡Encuentra tu vuelo!!!"
    puts "-"*50
    puts 
    puts "From:"
    flight_to_find << gets.chomp
    puts "To:" 
    flight_to_find << gets.chomp
    puts "Date (YYYY-MM-DD):"
    flight_to_find << gets.chomp
    puts "Passenger:"
    flight_to_find << gets.chomp
    flight_to_find
  end  

  def display_solicited_flight(flights, query)
    puts "-"*80
    puts "Vuelos disponibles From: #{query[0]} To: #{query[1]}"
    puts "-"*80
    if flights.empty? 
      puts ">>> No se encontraron vuelos disponibles hacia ese destino <<<"
    else 
      num = 0
      flights.each do |flight|
        num += 1
        puts "#{num}) No Vuelo: #{flight.num_flight}"
        puts "Date: #{flight.date}, Depart: #{flight.depart} UTC From: #{flight.from},"
        puts "To: #{flight.to}, Duration: #{flight.duration}, Precio:#{flight.cost}, Lugares:#{flight.passenger}"
        puts "-"*80
      end  
      puts "Selecciona tu vuelo:"
    end
    input = gets.chomp
    reservation = [input,query[3],flights]
    
  end 

  #LOGIN
  def display_login_options
    puts "-"*60
    puts "Necesita registrarse o iniciar sesión para reservar tu vuelo"
    puts "1) Registrarte "
    puts "2) Iniciar sesión"
    puts "Elige una opción:"    
    input = gets.chomp
    puts "-"*60
    input
  end 

  def display_registration
    register_user = []
    puts "Ingresa tu nombre"
    register_user << gets.chomp
    puts "Ingresa tu email"
    register_user << gets.chomp
    register_user << "false"
    puts "-"*60
    puts "Te has registrado con exito"
    puts "-"*60
    register_user
  end 
  
  def display_login 
    puts "-"*60
    puts "          Bienvenido al registro"
    puts "-"*60
    login_info = []
    puts "Ingresa tu nombre"
    login_info << gets.chomp
    puts "Ingresa tu email"
    login_info << gets.chomp
    login_info
  end  

  def login_validate(status)
    if status.empty? 
      puts
      puts " >>> Nombre o correo electronico no valido <<<"
      puts
    elsif status.count == 1
      puts "-"*80
      puts "Se ha registrado de forma exitosa"
    end
  end  

  def admin_login
    admin_user = []
    puts "-"*80
    puts "Bienvenido Administrador"
    puts "-"*80
    puts 
    puts "Ingresa tu nombre"
    admin_user << gets.chomp
    puts "Ingresa tu email"
    admin_user << gets.chomp
    admin_user    
  end  

  def show_reservation(seats,flight,user1)
    puts "-"*80
    puts "Número de Vuelo Seleccionado: #{flight[0]}"
    puts "-"*80
    puts "Date: #{flight[1]}, Depart: #{flight[2]}"
    puts "From: #{flight[3]}, To: #{flight[4]} , Duration: #{flight[5]}, Precio: #{flight[6]} pesos"
    puts "-"*80
    puts
    puts "Datos de Persona 1:"
    puts "Ingresa tu nombre :" 
    puts "#{user1[1]}" 
    puts "email:"
    puts "#{user1[2]}"
    users_to_register = []
    for i in (2..seats) 
      puts "-"*80
      puts "Ingresa los datos de los otros pasajeros"
      puts "Datos de Persona #{i}:"
      puts "Ingresa nombre :" 
      users_to_register << gets.chomp
      puts  "email:"
      users_to_register << gets.chomp
      users_to_register << "false"
    end 
    puts "Realizar reservacion 1) SI  2) NO"
    input = gets.chomp
    users_to_register << input 
    users_to_register
  end 
  
  def show_ticket(ticket)
    puts "-"*80
    puts "-"*80
    puts "++++++ Reservación correcta ++++++"
    puts "-"*80
    puts "-"*80
    puts 
    puts "El costo total es de $ #{ticket[0]} pesos"
    booking = ticket[1]
    puts "Y tu ID de reservación es la siguiente #{booking.id} "
    puts "-"*80
  end  

  #ADMINISTRADOR
  def show_admin_menu
    puts "-"*80
    puts "1) Mostrar todos los vuelos"
    puts "2) Mostrar todas las reservaciones"
    puts "3) Agrega un vuelo"
    puts "4) Salir"

    puts 
    puts "Selecciona opción:"
    input = gets.chomp
    input
  end  

  def show_flight(flights)
    puts "Estos son todos los vuelos programados"
    puts "-"*80
    puts
    if flights.empty? 
       puts ">>> No hay vuelos programados por el momento <<<"
    else 
      num = 0
      flights.each do |flight|
        num += 1
        puts "#{num}) No Vuelo: #{flight.num_flight}"
        puts "Date: #{flight.date}, Depart: #{flight.depart} UTC From: #{flight.from},"
        puts "To: #{flight.to}, Duration: #{flight.duration}, Precio:#{flight.cost}, Lugares:#{flight.passenger}"
        puts "-"*80
      end
    end   
  end  

  def show_reservations(reservations)
    puts "Estas son todas las reservaciones existentes"
    puts "-"*80
    if reservations.empty? 
      puts "> No hay reservaciones existentes por el momento <"
    else 
      num = 0 
      reservations.each do |reservation|
        num += 1
        puts "#{num}) ID de reservacion #{reservation.id}"
        puts "Booking number: #{reservation.num_booking}, Costo total: $#{reservation.total_cost} pesos, ID de vuelo: #{reservation.flight_id}"
        puts "-"*80
      end  
    end   
  end  

  def new_flight_info
    new_flight = []
    puts "Introduce la información del vuelo que deseas crear"
    puts "-"*80
    puts "Numero de vuelo"
    new_flight << gets.chomp
    puts "Fecha del vuelo (en formato: YYYY-MM-DD)"
    new_flight << gets.chomp
    puts "Hora del vuelo (en formato: HH:MM:SS)"
    new_flight << gets.chomp
    puts "Ciudad de origen"
    new_flight << gets.chomp
    puts "Ciudad de destino"
    new_flight << gets.chomp
    puts "Duracion del vuelo (en formato: HH:MM)"
    new_flight << gets.chomp
    puts "Precio en pesos mexicanos"
    new_flight << gets.chomp
    puts "Número asientos disponibles para este vuelo"
    new_flight << gets.chomp
    new_flight
  end  

  def confirmed_new_flight(flight)
    confirmation = flight
    puts "-"*80
    puts "Vuelo creado de forma exitosa"
    puts "-"*80
    puts "Este es el ID del vuelo #{confirmation.id}"
    puts "No Vuelo: #{confirmation.num_flight}"
    puts "Date: #{confirmation.date}, Depart: #{confirmation.depart} From: #{confirmation.from},"
    puts "To: #{flight.to}, Duration: #{confirmation.duration}, Precio:#{confirmation.cost}, Lugares:#{confirmation.passenger}"
    puts "-"*80
  end 

  def good_bye
   puts "Gracias por su preferencia"   
  end  
end
