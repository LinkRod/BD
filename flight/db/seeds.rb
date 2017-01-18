# Este archivo sirve para crear registros de prueba
flight1 = Flight.create(num_flight:'1378', date:'2017-01-06', depart:'07:15:16', from:'Mexico City', to:'Zacatecas', duration:'3:00', cost:'1500.00', passenger:'180')
flight2 = Flight.create(num_flight:'5156', date:'2017-01-07', depart:'10:20:00', from:'Mexico City', to:'Venecia', duration:'18:00', cost:'8000.00', passenger:'250')
flight3 = Flight.create(num_flight:'4664', date:'2017-01-08', depart:'13:15:00', from:'Mexico City', to:'Machu Pichu', duration:'12:00', cost:'4500.00', passenger:'752')
flight4 = Flight.create(num_flight:'8456', date:'2017-01-09', depart:'08:30:16', from:'Mexico City', to:'Tokio', duration:'16:00', cost:'7500.00', passenger:'455')
flight5 = Flight.create(num_flight:'3455', date:'2017-01-10', depart:'18:50:00', from:'Mexico City', to:'Rio de Janeiro', duration:'14:00', cost:'5000.00', passenger:'354')

Admin1 = User.create(name:'Hector', email:'hector@gmail.com', admin: true)
Admin2 = User.create(name:'Valeria', email:'valeria@gmail.com', admin: true)
Admin3 = User.create(name:'Bolo', email:'bolo@gmail.com', admin: true)
