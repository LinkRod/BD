class Flight < ActiveRecord::Base
 # has_many :users
 # has_many :bookings
end

class User < ActiveRecord::Base
# has_many :fligths
# has_many :bookings
end

class Booking < ActiveRecord::Base
# has_many :users
# belongs_to :fligths
end

class UserBooking < ActiveRecord::Base
# belongs_to :users
# belongs_to :bookings
end

class UserFlight < ActiveRecord::Base
# belongs_to :users
# belongs_to :fligths
end
