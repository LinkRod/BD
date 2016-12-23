class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 
  # Validaciones
  validates :email, :uniqueness => true #el email debe ser unico 
  validates :email, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]{2,}\z/,:message => "email like ejemplo@mail.com" }#el email tenga el formato con arroba y punto 
  validate :olderThan #el usuario sea mayor de edad 
  # Validaciones avanzadas
  validates :phone, :format => { :with => /\A.*([0-9]+.*){10,}\z/,:message => "email like ejemplo@mail.com" }
  # El modelo User - Crear metodos personalizados:
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end 

  def olderThan
    errors.add(:birthday,"need 18") if birthday.year > 1998
  end
end
