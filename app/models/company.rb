class Company < ApplicationRecord
    has_many :employees
    has_many :asserts
    has_many :payments
end