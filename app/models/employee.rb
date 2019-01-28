class Employee < ApplicationRecord
  has_one :salary
  has_one :attendance
  has_one :reimbursement
  belongs_to :company
end
