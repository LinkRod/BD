require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end

chef = Chef.create(first_name: "Eduardo", last_name: "Fernández", email:"eduardo@gmail.com", phone:"930-028-2908 x7555", birthday:Time.now)

chef = Chef.find(1)

# Este es un ejemplo de test ya que los nombres de los chefs son aleatorios, este test muy probablemente fallará
# assert chef[:first_name] == 'Ferran'
# assert chef[:last_name] == 'Adria'

chef[:first_name] == 'Eduardo'
chef[:last_name] == 'Fernández'

puts "finished"
