class Operator < ApplicationRecord
	has_one :Status
	has_one :WorkShop
	has_one :Service
	has_secure_password

end
