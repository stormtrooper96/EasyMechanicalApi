class Booking < ApplicationRecord
	has_one :User
	has_one :BookingStatus
	has_one :Operator
	has_one :Service
end
