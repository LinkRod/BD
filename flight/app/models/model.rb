class Flight < ActiveRecord::Base
 t.string :users
 :bookings
end

class User  < ActiveRecord::Base
:fligths
:bookings
end

class Booking < ActiveRecord::Base
:users
:fligths
end

class UserBooking < ActiveRecord::Base
:userflight
end

class UserFlight < ActiveRecord::Base

end
